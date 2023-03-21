import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'create_account_provider.dart';

class AuthenticationNotifier extends Notifier<User?> {
  final firebaseAuth = FirebaseAuth.instance;
  bool errorState = false;
  String errorText = '';

  @override
  User? build() {
    final user = firebaseAuth.currentUser;
    return user;
  }

  void signOut() {
    firebaseAuth.signOut();
    ref.invalidateSelf();
  }

  Future<void> signIn(String email, String password) async {
    errorState = false;
    try {
      await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      ref.invalidateSelf();
    } on FirebaseAuthException catch (e) {
      errorState = true;
      if (e.code == 'wrong-password') {
        errorText = 'You have entered an incorrect password. Please try again';
      } else if (e.code == 'user-not-found') {
        errorText = 'There is no user with this email';
      } else if (e.code == 'user-not-found') {
        errorText = 'There is no user registered with this email';
      } else if (e.code == 'network-request-failed' ||
          e.code == 'internal-error' ||
          e.code == 'invalid-auth-event' ||
          e.code == 'missing-iframe-start') {
        errorText = 'Something went wrong. Please try again later';
      }
    }
  }

  Future<void> createAccount(String email, String password) async {
    errorState = false;
    try {
      final user = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      ref.invalidateSelf();
    } on FirebaseAuthException catch (e) {
      errorState = true;
      if (e.code == 'email-already-in-use') {
        errorText = 'The provided email is already in use by an existing user.';
      } else if (e.code == 'network-request-failed' ||
          e.code == 'internal-error' ||
          e.code == 'invalid-auth-event' ||
          e.code == 'missing-iframe-start') {
        errorText = 'Something went wrong. Please try again later';
      }
    }
  }

  Future<void> configureAccount() async {
    print('auth $state');

    final user = state!;
    final accountInfo = ref.read(createAccountInfoProvider);
    await user.updatePhotoURL(accountInfo.imageUrl ?? '');
    await user.updateDisplayName(accountInfo.name!);
    await FirebaseFirestore.instance.collection('patients').doc(user.uid).set(
      {
        'id': user.uid,
        'email': user.email,
        'appointments': [],
        'joinedOn': DateTime.now().toIso8601String(),
        'chatList': [],
        'name': accountInfo.name!,
        'imageUrl': accountInfo.imageUrl ?? '',
        'dateOfBirth': accountInfo.dateOfBirth!.toIso8601String(),
      },
    );
    ref.invalidateSelf();
  }
}

final authenticationProvider = NotifierProvider<AuthenticationNotifier, User?>(
  () => AuthenticationNotifier(),
);
