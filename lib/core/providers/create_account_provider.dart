import 'dart:async';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import '../../presentation/widgets/authentication_handling_widgets/error_dialog.dart';
import 'auth_provider.dart';

class CreateAccountInfo {
  final String? name, imageUrl;
  final File? image;
  final DateTime? dateOfBirth;
  final double startProgress, endProgress;
  final bool drive;

  const CreateAccountInfo({
    this.image,
    this.dateOfBirth,
    this.name,
    this.imageUrl,
    this.startProgress = 0.0,
    this.endProgress = 0.0,
    this.drive = false,
  });

  CreateAccountInfo copyWith(
      {String? name,
      String? imageUrl,
      File? image,
      DateTime? dateOfBirth,
      double? startProgress,
      double? endProgress,
      bool? drive}) {
    return CreateAccountInfo(
      image: image ?? this.image,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      imageUrl: imageUrl ?? this.imageUrl,
      name: name ?? this.name,
      startProgress: startProgress ?? this.startProgress,
      endProgress: endProgress ?? this.endProgress,
      drive: drive ?? this.drive,
    );
  }

  @override
  String toString() => '$name $dateOfBirth $imageUrl ';
}

class CreateAccountInfoNotifier extends AutoDisposeNotifier<CreateAccountInfo> {
  bool drive = false;
  bool done = false;

  @override
  CreateAccountInfo build() {
    return const CreateAccountInfo();
  }

  void editInfo({String? name, String? imageUrl, DateTime? dateOfBirth}) {
    state = state.copyWith(
      name: name,
      imageUrl: imageUrl,
      dateOfBirth: dateOfBirth,
    );
  }

  Future<void> selectImage(BuildContext context) async {
    ImageSource? imageSource;
    await showDialog(
      context: context,
      builder: (context) => Dialog(
        child: Padding(
          padding: const EdgeInsetsDirectional.only(top: 10, bottom: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                title: Text(
                  'Pick a source',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt_outlined),
                title: const Text('Camera'),
                onTap: () {
                  imageSource = ImageSource.camera;
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.image),
                title: const Text('Gallery'),
                onTap: () {
                  imageSource = ImageSource.gallery;
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
      ),
    );
    if (imageSource == null) {
      return;
    }
    final imagePicker = ImagePicker();
    final xImage =
        (await imagePicker.pickImage(source: imageSource!, imageQuality: 100));
    if (xImage == null) return;
    final appPath = (await getApplicationDocumentsDirectory()).path;
    final imagePath = '$appPath/${basename(xImage.path)}';
    await xImage.saveTo(imagePath);
    final File image = File(imagePath);
    state = state.copyWith(image: image);
  }

  Future<void> uploadImage() async {
    final imageRef = FirebaseStorage.instance.ref(basename(state.image!.path));
    imageRef.putFile(state.image!).asStream().listen(
      (event) {
        drive = true;
        final transferred = event.bytesTransferred;
        final total = event.totalBytes;
        if (event.state == TaskState.success) done = true;
        state = state.copyWith(
          startProgress: state.endProgress == 1.0
              ? state.startProgress
              : state.endProgress,
          endProgress: total == -1 ? 0.0 : (transferred / total),
          drive: true,
        );
      },
    );
    while (state.endProgress != 1.0) {
      await Future.delayed(const Duration(milliseconds: 50));
    }
    var downloadUrl = await imageRef.getDownloadURL();
    state = state.copyWith(imageUrl: downloadUrl);
  }

  Future<int> createAccount({
    required ValueNotifier<List<int?>> dateOfBirth,
    required ValueNotifier<List<bool>> dateOfBirthErrorStateList,
    required GlobalKey<FormState> formKey,
    required BuildContext context,
    required String name,
    required String email,
    required String password,
  }) async {
    //Error Handling
    final dOB = dateOfBirth.value;
    dateOfBirthErrorStateList.value = [
      dOB[0] == null,
      dOB[1] == null,
      dOB[2] == null
    ];
    bool dateOfBirthErrorState = false;
    for (bool state in dateOfBirthErrorStateList.value) {
      dateOfBirthErrorState = state;
    }
    if (!formKey.currentState!.validate() || dateOfBirthErrorState) {
      return 1;
    }
    final imageStatus = state.image == null;

    //skipping image alert
    bool skipImage = true;
    if (imageStatus) {
      skipImage = false;
      await showDialog(
        context: context,
        builder: (_) => AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          alignment: Alignment.center,
          actionsAlignment: MainAxisAlignment.center,
          title: const Text(
            'Are you sure about not selecting a profile picture',
            textAlign: TextAlign.center,
          ),
          actions: [
            TextButton(
              onPressed: () {
                skipImage = true;
                Navigator.pop(context);
              },
              child: const Text('Yes'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('No'),
            ),
          ],
        ),
      );
    }
    final authProvider = authenticationProvider.notifier;
    if (!skipImage) {
      return 1;
    }
    if (!imageStatus) {
      await uploadImage();
    }

    //Creating Account with Firebase Auth
    editInfo(
      name: name,
      dateOfBirth: DateTime.parse(
          '${dOB[0]}-${dOB[1]! < 10 ? '0' : ''}${dOB[1]}-${dOB[1]! < 10 ? '0' : ''}${dOB[2]}'),
    );
    await ref.read(authProvider).createAccount(
          email,
          password,
        );
    if (ref.read(authProvider).errorState && context.mounted) {
      await errorDialog(
        ref.read(authProvider).errorText,
        context,
      );
      return 1;
    }
    await ref.read(authProvider).configureAccount();
    if (context.mounted) context.go('/home');
    return 0;
  }

  void stop() {
    drive = false;
  }
}

final createAccountInfoProvider =
    NotifierProvider.autoDispose<CreateAccountInfoNotifier, CreateAccountInfo>(
  () => CreateAccountInfoNotifier(),
);
