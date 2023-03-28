import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doclink/domain/entities/doctor.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/*
* holds a list of doctors instances as a state
* uses a converter to change from json to doctor member
* and provides this state to the app
* */
class DoctorRemoteDataSource extends AsyncNotifier<List<Doctor>> {
  final firestoreReference = FirebaseFirestore.instance.collection('doctors');
  @override
  Future<List<Doctor>> build() async {
    final snapshot = await firestoreReference
        .withConverter(
          fromFirestore: (snapshot, options) =>
              Doctor.fromJson(snapshot.data()!),
          toFirestore: (value, options) => {},
        )
        .get();
    return snapshot.docs.map((e) => e.data()).toList();
  }

  List<Doctor> getFavoriteDoctors(List<int> userFavoriteDoctors) {
    final list = <Doctor>[];
    for (int id in userFavoriteDoctors) {
      for (Doctor doctor in state.value!) {
        if (int.parse(doctor.id) == id) list.add(doctor);
      }
    }
    return list;
  }
}

final doctorsNotifierProvider =
    AsyncNotifierProvider<DoctorRemoteDataSource, List<Doctor>>(
  () => DoctorRemoteDataSource(),
);
