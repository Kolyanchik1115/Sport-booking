// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'facility_city.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FacilityCity _$FacilityCityFromJson(Map<String, dynamic> json) {
  return _FacilityCity.fromJson(json);
}

/// @nodoc
mixin _$FacilityCity {
  int get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FacilityCityCopyWith<FacilityCity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FacilityCityCopyWith<$Res> {
  factory $FacilityCityCopyWith(
          FacilityCity value, $Res Function(FacilityCity) then) =
      _$FacilityCityCopyWithImpl<$Res, FacilityCity>;
  @useResult
  $Res call({int id, String? name});
}

/// @nodoc
class _$FacilityCityCopyWithImpl<$Res, $Val extends FacilityCity>
    implements $FacilityCityCopyWith<$Res> {
  _$FacilityCityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
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
}

/// @nodoc
abstract class _$$FacilityCityImplCopyWith<$Res>
    implements $FacilityCityCopyWith<$Res> {
  factory _$$FacilityCityImplCopyWith(
          _$FacilityCityImpl value, $Res Function(_$FacilityCityImpl) then) =
      __$$FacilityCityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String? name});
}

/// @nodoc
class __$$FacilityCityImplCopyWithImpl<$Res>
    extends _$FacilityCityCopyWithImpl<$Res, _$FacilityCityImpl>
    implements _$$FacilityCityImplCopyWith<$Res> {
  __$$FacilityCityImplCopyWithImpl(
      _$FacilityCityImpl _value, $Res Function(_$FacilityCityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
  }) {
    return _then(_$FacilityCityImpl(
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
class _$FacilityCityImpl implements _FacilityCity {
  const _$FacilityCityImpl({required this.id, required this.name});

  factory _$FacilityCityImpl.fromJson(Map<String, dynamic> json) =>
      _$$FacilityCityImplFromJson(json);

  @override
  final int id;
  @override
  final String? name;

  @override
  String toString() {
    return 'FacilityCity(id: $id, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FacilityCityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FacilityCityImplCopyWith<_$FacilityCityImpl> get copyWith =>
      __$$FacilityCityImplCopyWithImpl<_$FacilityCityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FacilityCityImplToJson(
      this,
    );
  }
}

abstract class _FacilityCity implements FacilityCity {
  const factory _FacilityCity(
      {required final int id,
      required final String? name}) = _$FacilityCityImpl;

  factory _FacilityCity.fromJson(Map<String, dynamic> json) =
      _$FacilityCityImpl.fromJson;

  @override
  int get id;
  @override
  String? get name;
  @override
  @JsonKey(ignore: true)
  _$$FacilityCityImplCopyWith<_$FacilityCityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
