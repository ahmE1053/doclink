import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/providers/auth_provider.dart';
import '../../domain/entities/patient.dart';

class RemoteDataSource extends AsyncNotifier<Patient?> {
  @override
  Future<Patient?> build() async {
    final user = ref.watch(authenticationProvider);
    if (user != null) {
      print('fd');
      final patient = await FirebaseFirestore.instance
          .collection('patients')
          .doc(user.uid)
          .get();
      try {
        print(patient.data());
        Patient.fromJson(patient.data()!);
      } catch (e) {
        print(e);
      }
      return Patient.fromJson(patient.data()!);
    } else {
      return null;
    }
  }
}

final remoteDataSourceProvider =
    AsyncNotifierProvider<RemoteDataSource, Patient?>(() => RemoteDataSource());
