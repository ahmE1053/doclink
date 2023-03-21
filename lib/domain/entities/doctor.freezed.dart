// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'doctor.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Doctor _$DoctorFromJson(Map<String, dynamic> json) {
  return _Doctor.fromJson(json);
}

/// @nodoc
mixin _$Doctor {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get speciality => throw _privateConstructorUsedError;
  String get aboutDoctor => throw _privateConstructorUsedError;
  DateTime get joinedOn => throw _privateConstructorUsedError;
  List<Review> get reviews => throw _privateConstructorUsedError;
  double get rating => throw _privateConstructorUsedError;
  DoctorAvailability get availableOn => throw _privateConstructorUsedError;
  DoctorState get doctorState => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DoctorCopyWith<Doctor> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DoctorCopyWith<$Res> {
  factory $DoctorCopyWith(Doctor value, $Res Function(Doctor) then) =
      _$DoctorCopyWithImpl<$Res, Doctor>;
  @useResult
  $Res call(
      {String id,
      String name,
      String speciality,
      String aboutDoctor,
      DateTime joinedOn,
      List<Review> reviews,
      double rating,
      DoctorAvailability availableOn,
      DoctorState doctorState});
}

/// @nodoc
class _$DoctorCopyWithImpl<$Res, $Val extends Doctor>
    implements $DoctorCopyWith<$Res> {
  _$DoctorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? speciality = null,
    Object? aboutDoctor = null,
    Object? joinedOn = null,
    Object? reviews = null,
    Object? rating = null,
    Object? availableOn = null,
    Object? doctorState = null,
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
      speciality: null == speciality
          ? _value.speciality
          : speciality // ignore: cast_nullable_to_non_nullable
              as String,
      aboutDoctor: null == aboutDoctor
          ? _value.aboutDoctor
          : aboutDoctor // ignore: cast_nullable_to_non_nullable
              as String,
      joinedOn: null == joinedOn
          ? _value.joinedOn
          : joinedOn // ignore: cast_nullable_to_non_nullable
              as DateTime,
      reviews: null == reviews
          ? _value.reviews
          : reviews // ignore: cast_nullable_to_non_nullable
              as List<Review>,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      availableOn: null == availableOn
          ? _value.availableOn
          : availableOn // ignore: cast_nullable_to_non_nullable
              as DoctorAvailability,
      doctorState: null == doctorState
          ? _value.doctorState
          : doctorState // ignore: cast_nullable_to_non_nullable
              as DoctorState,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DoctorCopyWith<$Res> implements $DoctorCopyWith<$Res> {
  factory _$$_DoctorCopyWith(_$_Doctor value, $Res Function(_$_Doctor) then) =
      __$$_DoctorCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String speciality,
      String aboutDoctor,
      DateTime joinedOn,
      List<Review> reviews,
      double rating,
      DoctorAvailability availableOn,
      DoctorState doctorState});
}

/// @nodoc
class __$$_DoctorCopyWithImpl<$Res>
    extends _$DoctorCopyWithImpl<$Res, _$_Doctor>
    implements _$$_DoctorCopyWith<$Res> {
  __$$_DoctorCopyWithImpl(_$_Doctor _value, $Res Function(_$_Doctor) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? speciality = null,
    Object? aboutDoctor = null,
    Object? joinedOn = null,
    Object? reviews = null,
    Object? rating = null,
    Object? availableOn = null,
    Object? doctorState = null,
  }) {
    return _then(_$_Doctor(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      speciality: null == speciality
          ? _value.speciality
          : speciality // ignore: cast_nullable_to_non_nullable
              as String,
      aboutDoctor: null == aboutDoctor
          ? _value.aboutDoctor
          : aboutDoctor // ignore: cast_nullable_to_non_nullable
              as String,
      joinedOn: null == joinedOn
          ? _value.joinedOn
          : joinedOn // ignore: cast_nullable_to_non_nullable
              as DateTime,
      reviews: null == reviews
          ? _value._reviews
          : reviews // ignore: cast_nullable_to_non_nullable
              as List<Review>,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      availableOn: null == availableOn
          ? _value.availableOn
          : availableOn // ignore: cast_nullable_to_non_nullable
              as DoctorAvailability,
      doctorState: null == doctorState
          ? _value.doctorState
          : doctorState // ignore: cast_nullable_to_non_nullable
              as DoctorState,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Doctor implements _Doctor {
  const _$_Doctor(
      {required this.id,
      required this.name,
      required this.speciality,
      required this.aboutDoctor,
      required this.joinedOn,
      required final List<Review> reviews,
      required this.rating,
      required this.availableOn,
      required this.doctorState})
      : _reviews = reviews;

  factory _$_Doctor.fromJson(Map<String, dynamic> json) =>
      _$$_DoctorFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String speciality;
  @override
  final String aboutDoctor;
  @override
  final DateTime joinedOn;
  final List<Review> _reviews;
  @override
  List<Review> get reviews {
    if (_reviews is EqualUnmodifiableListView) return _reviews;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reviews);
  }

  @override
  final double rating;
  @override
  final DoctorAvailability availableOn;
  @override
  final DoctorState doctorState;

  @override
  String toString() {
    return 'Doctor(id: $id, name: $name, speciality: $speciality, aboutDoctor: $aboutDoctor, joinedOn: $joinedOn, reviews: $reviews, rating: $rating, availableOn: $availableOn, doctorState: $doctorState)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Doctor &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.speciality, speciality) ||
                other.speciality == speciality) &&
            (identical(other.aboutDoctor, aboutDoctor) ||
                other.aboutDoctor == aboutDoctor) &&
            (identical(other.joinedOn, joinedOn) ||
                other.joinedOn == joinedOn) &&
            const DeepCollectionEquality().equals(other._reviews, _reviews) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.availableOn, availableOn) ||
                other.availableOn == availableOn) &&
            (identical(other.doctorState, doctorState) ||
                other.doctorState == doctorState));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      speciality,
      aboutDoctor,
      joinedOn,
      const DeepCollectionEquality().hash(_reviews),
      rating,
      availableOn,
      doctorState);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DoctorCopyWith<_$_Doctor> get copyWith =>
      __$$_DoctorCopyWithImpl<_$_Doctor>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DoctorToJson(
      this,
    );
  }
}

abstract class _Doctor implements Doctor {
  const factory _Doctor(
      {required final String id,
      required final String name,
      required final String speciality,
      required final String aboutDoctor,
      required final DateTime joinedOn,
      required final List<Review> reviews,
      required final double rating,
      required final DoctorAvailability availableOn,
      required final DoctorState doctorState}) = _$_Doctor;

  factory _Doctor.fromJson(Map<String, dynamic> json) = _$_Doctor.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get speciality;
  @override
  String get aboutDoctor;
  @override
  DateTime get joinedOn;
  @override
  List<Review> get reviews;
  @override
  double get rating;
  @override
  DoctorAvailability get availableOn;
  @override
  DoctorState get doctorState;
  @override
  @JsonKey(ignore: true)
  _$$_DoctorCopyWith<_$_Doctor> get copyWith =>
      throw _privateConstructorUsedError;
}
