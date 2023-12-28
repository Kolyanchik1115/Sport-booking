// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'facility_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FacilityData _$FacilityDataFromJson(Map<String, dynamic> json) {
  return _FacilityData.fromJson(json);
}

/// @nodoc
mixin _$FacilityData {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  String? get sportType => throw _privateConstructorUsedError;
  String? get coveringType => throw _privateConstructorUsedError;
  String? get facilityType => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FacilityDataCopyWith<FacilityData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FacilityDataCopyWith<$Res> {
  factory $FacilityDataCopyWith(
          FacilityData value, $Res Function(FacilityData) then) =
      _$FacilityDataCopyWithImpl<$Res, FacilityData>;
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? address,
      String? sportType,
      String? coveringType,
      String? facilityType,
      String? description});
}

/// @nodoc
class _$FacilityDataCopyWithImpl<$Res, $Val extends FacilityData>
    implements $FacilityDataCopyWith<$Res> {
  _$FacilityDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? address = freezed,
    Object? sportType = freezed,
    Object? coveringType = freezed,
    Object? facilityType = freezed,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      sportType: freezed == sportType
          ? _value.sportType
          : sportType // ignore: cast_nullable_to_non_nullable
              as String?,
      coveringType: freezed == coveringType
          ? _value.coveringType
          : coveringType // ignore: cast_nullable_to_non_nullable
              as String?,
      facilityType: freezed == facilityType
          ? _value.facilityType
          : facilityType // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FacilityDataImplCopyWith<$Res>
    implements $FacilityDataCopyWith<$Res> {
  factory _$$FacilityDataImplCopyWith(
          _$FacilityDataImpl value, $Res Function(_$FacilityDataImpl) then) =
      __$$FacilityDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? address,
      String? sportType,
      String? coveringType,
      String? facilityType,
      String? description});
}

/// @nodoc
class __$$FacilityDataImplCopyWithImpl<$Res>
    extends _$FacilityDataCopyWithImpl<$Res, _$FacilityDataImpl>
    implements _$$FacilityDataImplCopyWith<$Res> {
  __$$FacilityDataImplCopyWithImpl(
      _$FacilityDataImpl _value, $Res Function(_$FacilityDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? address = freezed,
    Object? sportType = freezed,
    Object? coveringType = freezed,
    Object? facilityType = freezed,
    Object? description = freezed,
  }) {
    return _then(_$FacilityDataImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      sportType: freezed == sportType
          ? _value.sportType
          : sportType // ignore: cast_nullable_to_non_nullable
              as String?,
      coveringType: freezed == coveringType
          ? _value.coveringType
          : coveringType // ignore: cast_nullable_to_non_nullable
              as String?,
      facilityType: freezed == facilityType
          ? _value.facilityType
          : facilityType // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FacilityDataImpl implements _FacilityData {
  const _$FacilityDataImpl(
      {required this.id,
      required this.name,
      required this.address,
      required this.sportType,
      required this.coveringType,
      required this.facilityType,
      required this.description});

  factory _$FacilityDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$FacilityDataImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? address;
  @override
  final String? sportType;
  @override
  final String? coveringType;
  @override
  final String? facilityType;
  @override
  final String? description;

  @override
  String toString() {
    return 'FacilityData(id: $id, name: $name, address: $address, sportType: $sportType, coveringType: $coveringType, facilityType: $facilityType, description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FacilityDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.sportType, sportType) ||
                other.sportType == sportType) &&
            (identical(other.coveringType, coveringType) ||
                other.coveringType == coveringType) &&
            (identical(other.facilityType, facilityType) ||
                other.facilityType == facilityType) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, address, sportType,
      coveringType, facilityType, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FacilityDataImplCopyWith<_$FacilityDataImpl> get copyWith =>
      __$$FacilityDataImplCopyWithImpl<_$FacilityDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FacilityDataImplToJson(
      this,
    );
  }
}

abstract class _FacilityData implements FacilityData {
  const factory _FacilityData(
      {required final int? id,
      required final String? name,
      required final String? address,
      required final String? sportType,
      required final String? coveringType,
      required final String? facilityType,
      required final String? description}) = _$FacilityDataImpl;

  factory _FacilityData.fromJson(Map<String, dynamic> json) =
      _$FacilityDataImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  String? get address;
  @override
  String? get sportType;
  @override
  String? get coveringType;
  @override
  String? get facilityType;
  @override
  String? get description;
  @override
  @JsonKey(ignore: true)
  _$$FacilityDataImplCopyWith<_$FacilityDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
