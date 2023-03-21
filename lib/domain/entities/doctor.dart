import 'package:freezed_annotation/freezed_annotation.dart';

part 'doctor.freezed.dart';

part 'doctor.g.dart';

@freezed
class Doctor with _$Doctor {
  const factory Doctor({
    required String id,
    required String name,
    required String speciality,
    required String aboutDoctor,
    required DateTime joinedOn,
    required List<Review> reviews,
    required double rating,
    required DoctorAvailability availableOn,
    required DoctorState doctorState,
  }) = _Doctor;

  factory Doctor.fromJson(Map<String, Object?> json) => _$DoctorFromJson(json);
}

@JsonSerializable()
class Review {
  final double rating;
  final String review;

  const Review({required this.rating, required this.review});

  factory Review.fromJson(Map<String, Object?> json) => _$ReviewFromJson(json);

  Map<String, Object?> toJson() => _$ReviewToJson(this);
}

enum DoctorState {
  busy,
  available,
  offline,
}

@JsonSerializable()
class DoctorAvailability {
  final bool offline, online;
  final List<OnlineAvailability> onlineAvailability;
  final List<OfflineAvailability> offlineAvailability;

  const DoctorAvailability({
    required this.online,
    required this.offline,
    required this.onlineAvailability,
    required this.offlineAvailability,
  });

  factory DoctorAvailability.fromJson(Map<String, Object?> json) =>
      _$DoctorAvailabilityFromJson(json);

  Map<String, Object?> toJson() => _$DoctorAvailabilityToJson(this);
}

@JsonSerializable()
class OnlineAvailability {
  final DateTime day;
  final List<TimeInDayOnline> timesAvailable;

  const OnlineAvailability({required this.day, required this.timesAvailable});

  factory OnlineAvailability.fromJson(Map<String, Object?> json) =>
      _$OnlineAvailabilityFromJson(json);

  Map<String, Object?> toJson() => _$OnlineAvailabilityToJson(this);
}

@JsonSerializable()
class TimeInDayOnline {
  final String timeOfDay;
  final bool available;

  const TimeInDayOnline({
    required this.timeOfDay,
    required this.available,
  });

  factory TimeInDayOnline.fromJson(Map<String, Object?> json) =>
      _$TimeInDayOnlineFromJson(json);

  Map<String, Object?> toJson() => _$TimeInDayOnlineToJson(this);
}

@JsonSerializable()
class OfflineAvailability {
  final DateTime day;
  final String timeFrom, timeTo;

  const OfflineAvailability({
    required this.day,
    required this.timeFrom,
    required this.timeTo,
  });

  factory OfflineAvailability.fromJson(Map<String, Object?> json) =>
      _$OfflineAvailabilityFromJson(json);

  Map<String, Object?> toJson() => _$OfflineAvailabilityToJson(this);
}
