// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Review _$ReviewFromJson(Map<String, dynamic> json) => Review(
      rating: (json['rating'] as num).toDouble(),
      review: json['review'] as String,
    );

Map<String, dynamic> _$ReviewToJson(Review instance) => <String, dynamic>{
      'rating': instance.rating,
      'review': instance.review,
    };

DoctorAvailability _$DoctorAvailabilityFromJson(Map<String, dynamic> json) =>
    DoctorAvailability(
      online: json['online'] as bool,
      offline: json['offline'] as bool,
      onlineAvailability: (json['onlineAvailability'] as List<dynamic>)
          .map((e) => OnlineAvailability.fromJson(e as Map<String, dynamic>))
          .toList(),
      offlineAvailability: (json['offlineAvailability'] as List<dynamic>)
          .map((e) => OfflineAvailability.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DoctorAvailabilityToJson(DoctorAvailability instance) =>
    <String, dynamic>{
      'offline': instance.offline,
      'online': instance.online,
      'onlineAvailability': instance.onlineAvailability,
      'offlineAvailability': instance.offlineAvailability,
    };

OnlineAvailability _$OnlineAvailabilityFromJson(Map<String, dynamic> json) =>
    OnlineAvailability(
      day: DateTime.parse(json['day'] as String),
      timesAvailable: (json['timesAvailable'] as List<dynamic>)
          .map((e) => TimeInDayOnline.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OnlineAvailabilityToJson(OnlineAvailability instance) =>
    <String, dynamic>{
      'day': instance.day.toIso8601String(),
      'timesAvailable': instance.timesAvailable,
    };

TimeInDayOnline _$TimeInDayOnlineFromJson(Map<String, dynamic> json) =>
    TimeInDayOnline(
      timeOfDay: json['timeOfDay'] as String,
      available: json['available'] as bool,
    );

Map<String, dynamic> _$TimeInDayOnlineToJson(TimeInDayOnline instance) =>
    <String, dynamic>{
      'timeOfDay': instance.timeOfDay,
      'available': instance.available,
    };

OfflineAvailability _$OfflineAvailabilityFromJson(Map<String, dynamic> json) =>
    OfflineAvailability(
      day: DateTime.parse(json['day'] as String),
      timeFrom: json['timeFrom'] as String,
      timeTo: json['timeTo'] as String,
    );

Map<String, dynamic> _$OfflineAvailabilityToJson(
        OfflineAvailability instance) =>
    <String, dynamic>{
      'day': instance.day.toIso8601String(),
      'timeFrom': instance.timeFrom,
      'timeTo': instance.timeTo,
    };

_$_Doctor _$$_DoctorFromJson(Map<String, dynamic> json) => _$_Doctor(
      id: json['id'] as String,
      name: json['name'] as String,
      speciality: json['speciality'] as String,
      aboutDoctor: json['aboutDoctor'] as String,
      joinedOn: DateTime.parse(json['joinedOn'] as String),
      reviews: (json['reviews'] as List<dynamic>)
          .map((e) => Review.fromJson(e as Map<String, dynamic>))
          .toList(),
      rating: (json['rating'] as num).toDouble(),
      availableOn: DoctorAvailability.fromJson(
          json['availableOn'] as Map<String, dynamic>),
      doctorState: $enumDecode(_$DoctorStateEnumMap, json['doctorState']),
    );

Map<String, dynamic> _$$_DoctorToJson(_$_Doctor instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'speciality': instance.speciality,
      'aboutDoctor': instance.aboutDoctor,
      'joinedOn': instance.joinedOn.toIso8601String(),
      'reviews': instance.reviews,
      'rating': instance.rating,
      'availableOn': instance.availableOn,
      'doctorState': _$DoctorStateEnumMap[instance.doctorState]!,
    };

const _$DoctorStateEnumMap = {
  DoctorState.busy: 'busy',
  DoctorState.available: 'available',
  DoctorState.offline: 'offline',
};
