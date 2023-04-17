import 'package:freezed_annotation/freezed_annotation.dart';

part 'patient.freezed.dart';

part 'patient.g.dart';

@freezed
class Patient with _$Patient {
  @JsonSerializable(explicitToJson: true)
  const factory Patient({
    required String id,
    required String name,
    required DateTime joinedOn,
    required List<String> chatList,
    required List<String> appointments,
    required List<int> favoriteDoctors,
    required DateTime dateOfBirth,
    required String imageUrl,
    required String email,
  }) = _Patient;

  factory Patient.fromJson(Map<String, Object?> json) =>
      _$PatientFromJson(json);
}
