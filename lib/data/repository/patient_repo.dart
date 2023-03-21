import 'dart:io';

import 'package:doclink/domain/entities/chat.dart';

import 'package:doclink/domain/entities/patient.dart';

import '../../domain/repository/base_patient_repo.dart';

class PatientRepo extends BasePatientRepo {
  @override
  Future<void> addImage(String id, File image) async {}

  @override
  Future<void> addRating(String doctorId, double rating, [String review = '']) {
    // TODO: implement addRating
    throw UnimplementedError();
  }

  @override
  Future<void> createNewUser(
      String name, String email, String password, DateTime dateOfBirth) {
    // TODO: implement createNewUser
    throw UnimplementedError();
  }

  @override
  Future<void> makeAnAppointment(String doctorId, DateTime time,
      String additionalInfo, AppointmentLocation appointmentLocation) {
    // TODO: implement makeAnAppointment
    throw UnimplementedError();
  }

  @override
  Future<void> modifyInfo(Patient patient) {
    // TODO: implement modifyInfo
    throw UnimplementedError();
  }

  @override
  Future<void> sendAMessage(Chat chatMessage) {
    // TODO: implement sendAMessage
    throw UnimplementedError();
  }
}
