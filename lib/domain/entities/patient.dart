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
    //only the ids for each of the following 3, not the entire objects
    //each of those will be handled in the screen that require it to conserve memory
    required List<String> chatList,
    required List<String> appointments,
    required List<String> favoriteDoctors,
    required DateTime dateOfBirth,
    required String imageUrl,
    required String email,
  }) = _Patient;

  factory Patient.fromJson(Map<String, Object?> json) =>
      _$PatientFromJson(json);
}
