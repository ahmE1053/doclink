import 'package:doclink/domain/entities/appointment.dart';
import 'package:doclink/presentation/screens/home_screens/book_appointment.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

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
    required ClinicLocation location,
    required DoctorAvailability availableOn,
    required DoctorState doctorState,
  }) = _Doctor;

  factory Doctor.fromJson(Map<String, Object?> json) => _$DoctorFromJson(json);

  const Doctor._();

  bool get availableOnline => availableOn.online;

  bool get availableOffline => availableOn.offline;

  OnlineDayInfoForAppointmentBooking getDoctorAvailabilityForOnlineDay(
      DateTime day, String selectedDay) {
    final formattedCurrentDay = DateFormat.yMMMMd().format(day);
    final onlineDateDays = availableOn.onlineAvailability!
        .map((e) => DateFormat.yMMMMd().format(e.day));
    final isDayAvailable = onlineDateDays.contains(formattedCurrentDay);
    final timeState = isDayAvailable
        ? selectedDay == formattedCurrentDay
            ? TimeStates.selected
            : TimeStates.available
        : TimeStates.disabled;
    final availability = isDayAvailable
        ? availableOn.onlineAvailability!
            .where((element) =>
                DateFormat.yMMMMd().format(element.day) == formattedCurrentDay)
            .single
        : null;
    return OnlineDayInfoForAppointmentBooking(
      timeState: timeState,
      onlineAvailability: availability,
    );
  }

  OfflineDayInfoForAppointmentBooking getDoctorAvailabilityForOfflineDay(
      DateTime day, String selectedDay) {
    final formattedCurrentDay = DateFormat.yMMMMd().format(day);
    final offlineDateDays = availableOn.offlineAvailability!
        .map((e) => DateFormat.yMMMMd().format(e.day));

    final isDayAvailable = offlineDateDays.contains(formattedCurrentDay);

    final timeState = isDayAvailable
        ? selectedDay == formattedCurrentDay
            ? TimeStates.selected
            : TimeStates.available
        : TimeStates.disabled;

    final availability = isDayAvailable
        ? availableOn.offlineAvailability!
            .where((element) =>
                DateFormat.yMMMMd().format(element.day) == formattedCurrentDay)
            .single
        : null;
    return OfflineDayInfoForAppointmentBooking(
      timeState: timeState,
      offlineAvailability: availability,
    );
  }
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

@freezed
class ClinicLocation with _$ClinicLocation {
  const factory ClinicLocation(
      {required String location,
      required List<double> coordinates}) = _ClinicLocation;

  factory ClinicLocation.fromJson(Map<String, Object> json) =>
      _$ClinicLocationFromJson(json);
}
