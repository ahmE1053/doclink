// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Patient _$$_PatientFromJson(Map<String, dynamic> json) => _$_Patient(
      id: json['id'] as String,
      name: json['name'] as String,
      joinedOn: DateTime.parse(json['joinedOn'] as String),
      chatList:
          (json['chatList'] as List<dynamic>).map((e) => e as String).toList(),
      appointments: (json['appointments'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      favoriteDoctors: (json['favoriteDoctors'] as List<dynamic>)
          .map((e) => e as int)
          .toList(),
      dateOfBirth: DateTime.parse(json['dateOfBirth'] as String),
      imageUrl: json['imageUrl'] as String,
      email: json['email'] as String,
    );

Map<String, dynamic> _$$_PatientToJson(_$_Patient instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'joinedOn': instance.joinedOn.toIso8601String(),
      'chatList': instance.chatList,
      'appointments': instance.appointments,
      'favoriteDoctors': instance.favoriteDoctors,
      'dateOfBirth': instance.dateOfBirth.toIso8601String(),
      'imageUrl': instance.imageUrl,
      'email': instance.email,
    };

_$_Appointments _$$_AppointmentsFromJson(Map<String, dynamic> json) =>
    _$_Appointments(
      id: json['id'] as String,
      time: DateTime.parse(json['time'] as String),
      forAnotherPatient: json['forAnotherPatient'] as bool,
      appointmentState:
          $enumDecode(_$AppointmentStateEnumMap, json['appointmentState']),
      appointmentLocation: $enumDecode(
          _$AppointmentLocationEnumMap, json['appointmentLocation']),
      additionalInfo: json['additionalInfo'] as String,
      doctorId: json['doctorId'] as String,
      timeLeft: Duration(microseconds: json['timeLeft'] as int),
    );

Map<String, dynamic> _$$_AppointmentsToJson(_$_Appointments instance) =>
    <String, dynamic>{
      'id': instance.id,
      'time': instance.time.toIso8601String(),
      'forAnotherPatient': instance.forAnotherPatient,
      'appointmentState': _$AppointmentStateEnumMap[instance.appointmentState]!,
      'appointmentLocation':
          _$AppointmentLocationEnumMap[instance.appointmentLocation]!,
      'additionalInfo': instance.additionalInfo,
      'doctorId': instance.doctorId,
      'timeLeft': instance.timeLeft.inMicroseconds,
    };

const _$AppointmentStateEnumMap = {
  AppointmentState.coming: 'coming',
  AppointmentState.done: 'done',
  AppointmentState.absent: 'absent',
  AppointmentState.waitingForConfirmation: 'waitingForConfirmation',
};

const _$AppointmentLocationEnumMap = {
  AppointmentLocation.online: 'online',
  AppointmentLocation.atClinic: 'atClinic',
};
