// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bookings_facility_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BookingsFacilityResponse _$BookingsFacilityResponseFromJson(
    Map<String, dynamic> json) {
  return _BookingsFacilityResponse.fromJson(json);
}

/// @nodoc
mixin _$BookingsFacilityResponse {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  List<String> get images => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BookingsFacilityResponseCopyWith<BookingsFacilityResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookingsFacilityResponseCopyWith<$Res> {
  factory $BookingsFacilityResponseCopyWith(BookingsFacilityResponse value,
          $Res Function(BookingsFacilityResponse) then) =
      _$BookingsFacilityResponseCopyWithImpl<$Res, BookingsFacilityResponse>;
  @useResult
  $Res call({int id, String name, List<String> images});
}

/// @nodoc
class _$BookingsFacilityResponseCopyWithImpl<$Res,
        $Val extends BookingsFacilityResponse>
    implements $BookingsFacilityResponseCopyWith<$Res> {
  _$BookingsFacilityResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? images = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BookingsFacilityResponseImplCopyWith<$Res>
    implements $BookingsFacilityResponseCopyWith<$Res> {
  factory _$$BookingsFacilityResponseImplCopyWith(
          _$BookingsFacilityResponseImpl value,
          $Res Function(_$BookingsFacilityResponseImpl) then) =
      __$$BookingsFacilityResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, List<String> images});
}

/// @nodoc
class __$$BookingsFacilityResponseImplCopyWithImpl<$Res>
    extends _$BookingsFacilityResponseCopyWithImpl<$Res,
        _$BookingsFacilityResponseImpl>
    implements _$$BookingsFacilityResponseImplCopyWith<$Res> {
  __$$BookingsFacilityResponseImplCopyWithImpl(
      _$BookingsFacilityResponseImpl _value,
      $Res Function(_$BookingsFacilityResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? images = null,
  }) {
    return _then(_$BookingsFacilityResponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BookingsFacilityResponseImpl implements _BookingsFacilityResponse {
  const _$BookingsFacilityResponseImpl(
      {required this.id,
      required this.name,
      required final List<String> images})
      : _images = images;

  factory _$BookingsFacilityResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$BookingsFacilityResponseImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  final List<String> _images;
  @override
  List<String> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  String toString() {
    return 'BookingsFacilityResponse(id: $id, name: $name, images: $images)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookingsFacilityResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._images, _images));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, const DeepCollectionEquality().hash(_images));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BookingsFacilityResponseImplCopyWith<_$BookingsFacilityResponseImpl>
      get copyWith => __$$BookingsFacilityResponseImplCopyWithImpl<
          _$BookingsFacilityResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BookingsFacilityResponseImplToJson(
      this,
    );
  }
}

abstract class _BookingsFacilityResponse implements BookingsFacilityResponse {
  const factory _BookingsFacilityResponse(
      {required final int id,
      required final String name,
      required final List<String> images}) = _$BookingsFacilityResponseImpl;

  factory _BookingsFacilityResponse.fromJson(Map<String, dynamic> json) =
      _$BookingsFacilityResponseImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  List<String> get images;
  @override
  @JsonKey(ignore: true)
  _$$BookingsFacilityResponseImplCopyWith<_$BookingsFacilityResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
