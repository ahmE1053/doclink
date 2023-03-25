import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/providers/auth_provider.dart';
import '../../domain/entities/patient.dart';

class PatientRemoteDataSource extends AsyncNotifier<Patient?> {
  @override
  Future<Patient?> build() async {
    final user = ref.watch(authenticationProvider);
    if (user != null) {
      final patient = await FirebaseFirestore.instance
          .collection('patients')
          .doc(user.uid)
          .get();
      try {
        Patient.fromJson(patient.data()!);
      } catch (e) {}
      return Patient.fromJson(patient.data()!);
    } else {
      return null;
    }
  }

  Future<void> handleFavorite(int doctorId) async {
    final patient = state.value!;
    final List<int> favoriteDoctors = List.from(patient.favoriteDoctors);
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
}

final patientRemoteDataSourceProvider =
    AsyncNotifierProvider<PatientRemoteDataSource, Patient?>(
        () => PatientRemoteDataSource());
