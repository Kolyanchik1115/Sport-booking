// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'facility_district.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FacilityDistrict _$FacilityDistrictFromJson(Map<String, dynamic> json) {
  return _FacilityDistrict.fromJson(json);
}

/// @nodoc
mixin _$FacilityDistrict {
  FacilityCity? get city => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FacilityDistrictCopyWith<FacilityDistrict> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FacilityDistrictCopyWith<$Res> {
  factory $FacilityDistrictCopyWith(
          FacilityDistrict value, $Res Function(FacilityDistrict) then) =
      _$FacilityDistrictCopyWithImpl<$Res, FacilityDistrict>;
  @useResult
  $Res call({FacilityCity? city, int id, String? name});

  $FacilityCityCopyWith<$Res>? get city;
}

/// @nodoc
class _$FacilityDistrictCopyWithImpl<$Res, $Val extends FacilityDistrict>
    implements $FacilityDistrictCopyWith<$Res> {
  _$FacilityDistrictCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? city = freezed,
    Object? id = null,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as FacilityCity?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FacilityCityCopyWith<$Res>? get city {
    if (_value.city == null) {
      return null;
    }

    return $FacilityCityCopyWith<$Res>(_value.city!, (value) {
      return _then(_value.copyWith(city: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FacilityDistrictImplCopyWith<$Res>
    implements $FacilityDistrictCopyWith<$Res> {
  factory _$$FacilityDistrictImplCopyWith(_$FacilityDistrictImpl value,
          $Res Function(_$FacilityDistrictImpl) then) =
      __$$FacilityDistrictImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({FacilityCity? city, int id, String? name});

  @override
  $FacilityCityCopyWith<$Res>? get city;
}

/// @nodoc
class __$$FacilityDistrictImplCopyWithImpl<$Res>
    extends _$FacilityDistrictCopyWithImpl<$Res, _$FacilityDistrictImpl>
    implements _$$FacilityDistrictImplCopyWith<$Res> {
  __$$FacilityDistrictImplCopyWithImpl(_$FacilityDistrictImpl _value,
      $Res Function(_$FacilityDistrictImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? city = freezed,
    Object? id = null,
    Object? name = freezed,
  }) {
    return _then(_$FacilityDistrictImpl(
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as FacilityCity?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FacilityDistrictImpl implements _FacilityDistrict {
  const _$FacilityDistrictImpl(
      {required this.city, required this.id, required this.name});

  factory _$FacilityDistrictImpl.fromJson(Map<String, dynamic> json) =>
      _$$FacilityDistrictImplFromJson(json);

  @override
  final FacilityCity? city;
  @override
  final int id;
  @override
  final String? name;

  @override
  String toString() {
    return 'FacilityDistrict(city: $city, id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FacilityDistrictImpl &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, city, id, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FacilityDistrictImplCopyWith<_$FacilityDistrictImpl> get copyWith =>
      __$$FacilityDistrictImplCopyWithImpl<_$FacilityDistrictImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FacilityDistrictImplToJson(
      this,
    );
  }
}

abstract class _FacilityDistrict implements FacilityDistrict {
  const factory _FacilityDistrict(
      {required final FacilityCity? city,
      required final int id,
      required final String? name}) = _$FacilityDistrictImpl;

  factory _FacilityDistrict.fromJson(Map<String, dynamic> json) =
      _$FacilityDistrictImpl.fromJson;

  @override
  FacilityCity? get city;
  @override
  int get id;
  @override
  String? get name;
  @override
  @JsonKey(ignore: true)
  _$$FacilityDistrictImplCopyWith<_$FacilityDistrictImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
