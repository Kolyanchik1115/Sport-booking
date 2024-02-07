// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'facility_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FacilityResponse _$FacilityResponseFromJson(Map<String, dynamic> json) {
  return _FacilityResponse.fromJson(json);
}

/// @nodoc
mixin _$FacilityResponse {
  List<FacilityData> get facilities => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FacilityResponseCopyWith<FacilityResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FacilityResponseCopyWith<$Res> {
  factory $FacilityResponseCopyWith(
          FacilityResponse value, $Res Function(FacilityResponse) then) =
      _$FacilityResponseCopyWithImpl<$Res, FacilityResponse>;
  @useResult
  $Res call({List<FacilityData> facilities});
}

/// @nodoc
class _$FacilityResponseCopyWithImpl<$Res, $Val extends FacilityResponse>
    implements $FacilityResponseCopyWith<$Res> {
  _$FacilityResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? facilities = null,
  }) {
    return _then(_value.copyWith(
      facilities: null == facilities
          ? _value.facilities
          : facilities // ignore: cast_nullable_to_non_nullable
              as List<FacilityData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FacilityResponseImplCopyWith<$Res>
    implements $FacilityResponseCopyWith<$Res> {
  factory _$$FacilityResponseImplCopyWith(_$FacilityResponseImpl value,
          $Res Function(_$FacilityResponseImpl) then) =
      __$$FacilityResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<FacilityData> facilities});
}

/// @nodoc
class __$$FacilityResponseImplCopyWithImpl<$Res>
    extends _$FacilityResponseCopyWithImpl<$Res, _$FacilityResponseImpl>
    implements _$$FacilityResponseImplCopyWith<$Res> {
  __$$FacilityResponseImplCopyWithImpl(_$FacilityResponseImpl _value,
      $Res Function(_$FacilityResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? facilities = null,
  }) {
    return _then(_$FacilityResponseImpl(
      facilities: null == facilities
          ? _value._facilities
          : facilities // ignore: cast_nullable_to_non_nullable
              as List<FacilityData>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FacilityResponseImpl implements _FacilityResponse {
  const _$FacilityResponseImpl({required final List<FacilityData> facilities})
      : _facilities = facilities;

  factory _$FacilityResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$FacilityResponseImplFromJson(json);

  final List<FacilityData> _facilities;
  @override
  List<FacilityData> get facilities {
    if (_facilities is EqualUnmodifiableListView) return _facilities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_facilities);
  }

  @override
  String toString() {
    return 'FacilityResponse(facilities: $facilities)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FacilityResponseImpl &&
            const DeepCollectionEquality()
                .equals(other._facilities, _facilities));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_facilities));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FacilityResponseImplCopyWith<_$FacilityResponseImpl> get copyWith =>
      __$$FacilityResponseImplCopyWithImpl<_$FacilityResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FacilityResponseImplToJson(
      this,
    );
  }
}

abstract class _FacilityResponse implements FacilityResponse {
  const factory _FacilityResponse(
      {required final List<FacilityData> facilities}) = _$FacilityResponseImpl;

  factory _FacilityResponse.fromJson(Map<String, dynamic> json) =
      _$FacilityResponseImpl.fromJson;

  @override
  List<FacilityData> get facilities;
  @override
  @JsonKey(ignore: true)
  _$$FacilityResponseImplCopyWith<_$FacilityResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
