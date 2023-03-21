// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'patient.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Patient _$PatientFromJson(Map<String, dynamic> json) {
  return _Patient.fromJson(json);
}

/// @nodoc
mixin _$Patient {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  DateTime get joinedOn => throw _privateConstructorUsedError;
  List<String> get chatList => throw _privateConstructorUsedError;
  List<String> get appointments => throw _privateConstructorUsedError;
  DateTime get dateOfBirth => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PatientCopyWith<Patient> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PatientCopyWith<$Res> {
  factory $PatientCopyWith(Patient value, $Res Function(Patient) then) =
      _$PatientCopyWithImpl<$Res, Patient>;
  @useResult
  $Res call(
      {String id,
      String name,
      DateTime joinedOn,
      List<String> chatList,
      List<String> appointments,
      DateTime dateOfBirth,
      String imageUrl,
      String email});
}

/// @nodoc
class _$PatientCopyWithImpl<$Res, $Val extends Patient>
    implements $PatientCopyWith<$Res> {
  _$PatientCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? joinedOn = null,
    Object? chatList = null,
    Object? appointments = null,
    Object? dateOfBirth = null,
    Object? imageUrl = null,
    Object? email = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      joinedOn: null == joinedOn
          ? _value.joinedOn
          : joinedOn // ignore: cast_nullable_to_non_nullable
              as DateTime,
      chatList: null == chatList
          ? _value.chatList
          : chatList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      appointments: null == appointments
          ? _value.appointments
          : appointments // ignore: cast_nullable_to_non_nullable
              as List<String>,
      dateOfBirth: null == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as DateTime,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PatientCopyWith<$Res> implements $PatientCopyWith<$Res> {
  factory _$$_PatientCopyWith(
          _$_Patient value, $Res Function(_$_Patient) then) =
      __$$_PatientCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      DateTime joinedOn,
      List<String> chatList,
      List<String> appointments,
      DateTime dateOfBirth,
      String imageUrl,
      String email});
}

/// @nodoc
class __$$_PatientCopyWithImpl<$Res>
    extends _$PatientCopyWithImpl<$Res, _$_Patient>
    implements _$$_PatientCopyWith<$Res> {
  __$$_PatientCopyWithImpl(_$_Patient _value, $Res Function(_$_Patient) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? joinedOn = null,
    Object? chatList = null,
    Object? appointments = null,
    Object? dateOfBirth = null,
    Object? imageUrl = null,
    Object? email = null,
  }) {
    return _then(_$_Patient(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      joinedOn: null == joinedOn
          ? _value.joinedOn
          : joinedOn // ignore: cast_nullable_to_non_nullable
              as DateTime,
      chatList: null == chatList
          ? _value._chatList
          : chatList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      appointments: null == appointments
          ? _value._appointments
          : appointments // ignore: cast_nullable_to_non_nullable
              as List<String>,
      dateOfBirth: null == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as DateTime,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Patient implements _Patient {
  const _$_Patient(
      {required this.id,
      required this.name,
      required this.joinedOn,
      required final List<String> chatList,
      required final List<String> appointments,
      required this.dateOfBirth,
      required this.imageUrl,
      required this.email})
      : _chatList = chatList,
        _appointments = appointments;

  factory _$_Patient.fromJson(Map<String, dynamic> json) =>
      _$$_PatientFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final DateTime joinedOn;
  final List<String> _chatList;
  @override
  List<String> get chatList {
    if (_chatList is EqualUnmodifiableListView) return _chatList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_chatList);
  }

  final List<String> _appointments;
  @override
  List<String> get appointments {
    if (_appointments is EqualUnmodifiableListView) return _appointments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_appointments);
  }

  @override
  final DateTime dateOfBirth;
  @override
  final String imageUrl;
  @override
  final String email;

  @override
  String toString() {
    return 'Patient(id: $id, name: $name, joinedOn: $joinedOn, chatList: $chatList, appointments: $appointments, dateOfBirth: $dateOfBirth, imageUrl: $imageUrl, email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Patient &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.joinedOn, joinedOn) ||
                other.joinedOn == joinedOn) &&
            const DeepCollectionEquality().equals(other._chatList, _chatList) &&
            const DeepCollectionEquality()
                .equals(other._appointments, _appointments) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      joinedOn,
      const DeepCollectionEquality().hash(_chatList),
      const DeepCollectionEquality().hash(_appointments),
      dateOfBirth,
      imageUrl,
      email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PatientCopyWith<_$_Patient> get copyWith =>
      __$$_PatientCopyWithImpl<_$_Patient>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PatientToJson(
      this,
    );
  }
}

abstract class _Patient implements Patient {
  const factory _Patient(
      {required final String id,
      required final String name,
      required final DateTime joinedOn,
      required final List<String> chatList,
      required final List<String> appointments,
      required final DateTime dateOfBirth,
      required final String imageUrl,
      required final String email}) = _$_Patient;

  factory _Patient.fromJson(Map<String, dynamic> json) = _$_Patient.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  DateTime get joinedOn;
  @override
  List<String> get chatList;
  @override
  List<String> get appointments;
  @override
  DateTime get dateOfBirth;
  @override
  String get imageUrl;
  @override
  String get email;
  @override
  @JsonKey(ignore: true)
  _$$_PatientCopyWith<_$_Patient> get copyWith =>
      throw _privateConstructorUsedError;
}

Appointments _$AppointmentsFromJson(Map<String, dynamic> json) {
  return _Appointments.fromJson(json);
}

/// @nodoc
mixin _$Appointments {
  String get id => throw _privateConstructorUsedError;
  DateTime get time => throw _privateConstructorUsedError;
  bool get forAnotherPatient => throw _privateConstructorUsedError;
  AppointmentState get appointmentState => throw _privateConstructorUsedError;
  AppointmentLocation get appointmentLocation =>
      throw _privateConstructorUsedError;
  String get additionalInfo => throw _privateConstructorUsedError;
  String get doctorId => throw _privateConstructorUsedError;
  Duration get timeLeft => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppointmentsCopyWith<Appointments> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppointmentsCopyWith<$Res> {
  factory $AppointmentsCopyWith(
          Appointments value, $Res Function(Appointments) then) =
      _$AppointmentsCopyWithImpl<$Res, Appointments>;
  @useResult
  $Res call(
      {String id,
      DateTime time,
      bool forAnotherPatient,
      AppointmentState appointmentState,
      AppointmentLocation appointmentLocation,
      String additionalInfo,
      String doctorId,
      Duration timeLeft});
}

/// @nodoc
class _$AppointmentsCopyWithImpl<$Res, $Val extends Appointments>
    implements $AppointmentsCopyWith<$Res> {
  _$AppointmentsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? time = null,
    Object? forAnotherPatient = null,
    Object? appointmentState = null,
    Object? appointmentLocation = null,
    Object? additionalInfo = null,
    Object? doctorId = null,
    Object? timeLeft = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
      forAnotherPatient: null == forAnotherPatient
          ? _value.forAnotherPatient
          : forAnotherPatient // ignore: cast_nullable_to_non_nullable
              as bool,
      appointmentState: null == appointmentState
          ? _value.appointmentState
          : appointmentState // ignore: cast_nullable_to_non_nullable
              as AppointmentState,
      appointmentLocation: null == appointmentLocation
          ? _value.appointmentLocation
          : appointmentLocation // ignore: cast_nullable_to_non_nullable
              as AppointmentLocation,
      additionalInfo: null == additionalInfo
          ? _value.additionalInfo
          : additionalInfo // ignore: cast_nullable_to_non_nullable
              as String,
      doctorId: null == doctorId
          ? _value.doctorId
          : doctorId // ignore: cast_nullable_to_non_nullable
              as String,
      timeLeft: null == timeLeft
          ? _value.timeLeft
          : timeLeft // ignore: cast_nullable_to_non_nullable
              as Duration,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AppointmentsCopyWith<$Res>
    implements $AppointmentsCopyWith<$Res> {
  factory _$$_AppointmentsCopyWith(
          _$_Appointments value, $Res Function(_$_Appointments) then) =
      __$$_AppointmentsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      DateTime time,
      bool forAnotherPatient,
      AppointmentState appointmentState,
      AppointmentLocation appointmentLocation,
      String additionalInfo,
      String doctorId,
      Duration timeLeft});
}

/// @nodoc
class __$$_AppointmentsCopyWithImpl<$Res>
    extends _$AppointmentsCopyWithImpl<$Res, _$_Appointments>
    implements _$$_AppointmentsCopyWith<$Res> {
  __$$_AppointmentsCopyWithImpl(
      _$_Appointments _value, $Res Function(_$_Appointments) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? time = null,
    Object? forAnotherPatient = null,
    Object? appointmentState = null,
    Object? appointmentLocation = null,
    Object? additionalInfo = null,
    Object? doctorId = null,
    Object? timeLeft = null,
  }) {
    return _then(_$_Appointments(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
      forAnotherPatient: null == forAnotherPatient
          ? _value.forAnotherPatient
          : forAnotherPatient // ignore: cast_nullable_to_non_nullable
              as bool,
      appointmentState: null == appointmentState
          ? _value.appointmentState
          : appointmentState // ignore: cast_nullable_to_non_nullable
              as AppointmentState,
      appointmentLocation: null == appointmentLocation
          ? _value.appointmentLocation
          : appointmentLocation // ignore: cast_nullable_to_non_nullable
              as AppointmentLocation,
      additionalInfo: null == additionalInfo
          ? _value.additionalInfo
          : additionalInfo // ignore: cast_nullable_to_non_nullable
              as String,
      doctorId: null == doctorId
          ? _value.doctorId
          : doctorId // ignore: cast_nullable_to_non_nullable
              as String,
      timeLeft: null == timeLeft
          ? _value.timeLeft
          : timeLeft // ignore: cast_nullable_to_non_nullable
              as Duration,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Appointments implements _Appointments {
  const _$_Appointments(
      {required this.id,
      required this.time,
      required this.forAnotherPatient,
      required this.appointmentState,
      required this.appointmentLocation,
      required this.additionalInfo,
      required this.doctorId,
      required this.timeLeft});

  factory _$_Appointments.fromJson(Map<String, dynamic> json) =>
      _$$_AppointmentsFromJson(json);

  @override
  final String id;
  @override
  final DateTime time;
  @override
  final bool forAnotherPatient;
  @override
  final AppointmentState appointmentState;
  @override
  final AppointmentLocation appointmentLocation;
  @override
  final String additionalInfo;
  @override
  final String doctorId;
  @override
  final Duration timeLeft;

  @override
  String toString() {
    return 'Appointments(id: $id, time: $time, forAnotherPatient: $forAnotherPatient, appointmentState: $appointmentState, appointmentLocation: $appointmentLocation, additionalInfo: $additionalInfo, doctorId: $doctorId, timeLeft: $timeLeft)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Appointments &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.forAnotherPatient, forAnotherPatient) ||
                other.forAnotherPatient == forAnotherPatient) &&
            (identical(other.appointmentState, appointmentState) ||
                other.appointmentState == appointmentState) &&
            (identical(other.appointmentLocation, appointmentLocation) ||
                other.appointmentLocation == appointmentLocation) &&
            (identical(other.additionalInfo, additionalInfo) ||
                other.additionalInfo == additionalInfo) &&
            (identical(other.doctorId, doctorId) ||
                other.doctorId == doctorId) &&
            (identical(other.timeLeft, timeLeft) ||
                other.timeLeft == timeLeft));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      time,
      forAnotherPatient,
      appointmentState,
      appointmentLocation,
      additionalInfo,
      doctorId,
      timeLeft);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AppointmentsCopyWith<_$_Appointments> get copyWith =>
      __$$_AppointmentsCopyWithImpl<_$_Appointments>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AppointmentsToJson(
      this,
    );
  }
}

abstract class _Appointments implements Appointments {
  const factory _Appointments(
      {required final String id,
      required final DateTime time,
      required final bool forAnotherPatient,
      required final AppointmentState appointmentState,
      required final AppointmentLocation appointmentLocation,
      required final String additionalInfo,
      required final String doctorId,
      required final Duration timeLeft}) = _$_Appointments;

  factory _Appointments.fromJson(Map<String, dynamic> json) =
      _$_Appointments.fromJson;

  @override
  String get id;
  @override
  DateTime get time;
  @override
  bool get forAnotherPatient;
  @override
  AppointmentState get appointmentState;
  @override
  AppointmentLocation get appointmentLocation;
  @override
  String get additionalInfo;
  @override
  String get doctorId;
  @override
  Duration get timeLeft;
  @override
  @JsonKey(ignore: true)
  _$$_AppointmentsCopyWith<_$_Appointments> get copyWith =>
      throw _privateConstructorUsedError;
}
