import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/providers/auth_provider.dart';
import '../../domain/entities/patient.dart';

/*
* holds the state of the current user
* return a null state if the user is not signed in and return the
* user info in the form of a patient class by using the id of the firebase auth user
* and get the related info of this id from firestore
* */

class PatientRemoteDataSource extends AsyncNotifier<Patient?> {
  @override
  Future<Patient?> build() async {
    final user = ref.watch(authenticationProvider);
    if (user != null) {
      final patient = await FirebaseFirestore.instance
          .collection('patients')
          .doc(user.uid)
          .get();

      Patient.fromJson(patient.data()!);

      return Patient.fromJson(patient.data()!);
    } else {
      return null;
    }
  }

  /*
  * handles adding or removing a favorite doctor from the user list
  * */

  Future<void> handleFavorite(String doctorId) async {
    final patient = state.value!;
    final List<String> favoriteDoctors = List.from(patient.favoriteDoctors);
    final firestoreRef = FirebaseFirestore.instance.collection('patients').doc(
          patient.id,
        );
    if (favoriteDoctors.contains(doctorId)) {
      favoriteDoctors.remove(doctorId);
    } else {
      favoriteDoctors.add(doctorId);
    }
    await firestoreRef.update(
      {'favoriteDoctors': favoriteDoctors},
    );
    state = AsyncData(
      patient.copyWith(
        favoriteDoctors: favoriteDoctors,
      ),
    );
  }

  void copyWith(Patient patient) {
    state = AsyncValue.data(patient);
  }
}

final patientRemoteDataSourceProvider =
    AsyncNotifierProvider<PatientRemoteDataSource, Patient?>(
        () => PatientRemoteDataSource());
