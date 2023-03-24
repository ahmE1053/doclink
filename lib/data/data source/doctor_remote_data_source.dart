import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doclink/domain/entities/doctor.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
}

final doctorsNotifierProvider =
    AsyncNotifierProvider<DoctorRemoteDataSource, List<Doctor>>(
  () => DoctorRemoteDataSource(),
);
