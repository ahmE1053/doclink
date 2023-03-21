import 'package:freezed_annotation/freezed_annotation.dart';

part 'patient.freezed.dart';

part 'patient.g.dart';

@freezed
class Patient with _$Patient {
  const factory Patient({
    required String id,
    required String name,
    required DateTime joinedOn,
    required List<String> chatList,
    required List<String> appointments,
    required DateTime dateOfBirth,
    required String imageUrl,
    required String email,
  }) = _Patient;

  factory Patient.fromJson(Map<String, Object?> json) =>
      _$PatientFromJson(json);
}

@freezed
class Appointments with _$Appointments {
  const factory Appointments({
    required String id,
    required DateTime time,
    required bool forAnotherPatient,
    required AppointmentState appointmentState,
    required AppointmentLocation appointmentLocation,
    required String additionalInfo,
    required String doctorId,
    required Duration timeLeft,
  }) = _Appointments;

  factory Appointments.fromJson(Map<String, Object?> json) =>
      _$AppointmentsFromJson(json);
}

enum AppointmentState {
  coming,
  done,
  absent,
  waitingForConfirmation,
}

enum AppointmentLocation {
  online,
  atClinic,
}
