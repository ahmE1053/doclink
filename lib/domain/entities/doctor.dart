import 'package:freezed_annotation/freezed_annotation.dart';

part 'doctor.freezed.dart';

part 'doctor.g.dart';

@freezed
class Doctor with _$Doctor {
  @JsonSerializable(explicitToJson: true)
  const factory Doctor({
    required String id,
    required String name,
    required String imageUrl,
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

@freezed
class Review with _$Review {
  const factory Review({required double rating, required String review}) =
      _Review;

  factory Review.fromJson(Map<String, Object?> json) => _$ReviewFromJson(json);
}

enum DoctorState {
  busy,
  available,
  offline,
}

@freezed
class DoctorAvailability with _$DoctorAvailability {
  @JsonSerializable(explicitToJson: true)
  const factory DoctorAvailability({
    required bool online,
    required bool offline,
    List<OnlineAvailability>? onlineAvailability,
    List<OfflineAvailability>? offlineAvailability,
  }) = _DoctorAvailability;

  factory DoctorAvailability.fromJson(Map<String, Object?> json) =>
      _$DoctorAvailabilityFromJson(json);
}

@freezed
class OnlineAvailability with _$OnlineAvailability {
  @JsonSerializable(explicitToJson: true)
  const factory OnlineAvailability(
      {required DateTime day,
      required List<TimeInDayOnline> timesAvailable}) = _OnlineAvailability;

  factory OnlineAvailability.fromJson(Map<String, Object?> json) =>
      _$OnlineAvailabilityFromJson(json);
}

@freezed
class TimeInDayOnline with _$TimeInDayOnline {
  const factory TimeInDayOnline({
    required String timeOfDay,
    required bool available,
  }) = _TimeInDayOnline;

  factory TimeInDayOnline.fromJson(Map<String, Object?> json) =>
      _$TimeInDayOnlineFromJson(json);
}

@freezed
class OfflineAvailability with _$OfflineAvailability {
  const factory OfflineAvailability({
    required DateTime day,
    required String timeFrom,
    required String timeTo,
  }) = _OfflineAvailability;

  factory OfflineAvailability.fromJson(Map<String, Object?> json) =>
      _$OfflineAvailabilityFromJson(json);
}
