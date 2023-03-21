import 'dart:io';

import '../entities/chat.dart';
import '../entities/patient.dart';

abstract class BasePatientRepo {
  Future<void> createNewUser(
      String name, String email, String password, DateTime dateOfBirth);

  Future<void> addImage(String id, File image);

  Future<void> makeAnAppointment(String doctorId, DateTime time,
      String additionalInfo, AppointmentLocation appointmentLocation);

  Future<void> addRating(String doctorId, double rating, [String review = '']);

  Future<void> sendAMessage(Chat chatMessage);

  Future<void> modifyInfo(Patient patient);
}
