// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_booking_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CreateBookingResponse _$CreateBookingResponseFromJson(
    Map<String, dynamic> json) {
  return _CreateBookingResponse.fromJson(json);
}

/// @nodoc
mixin _$CreateBookingResponse {
  int? get id => throw _privateConstructorUsedError;
  int? get userId => throw _privateConstructorUsedError;
  int? get facilityId => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  int? get price => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateBookingResponseCopyWith<CreateBookingResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateBookingResponseCopyWith<$Res> {
  factory $CreateBookingResponseCopyWith(CreateBookingResponse value,
          $Res Function(CreateBookingResponse) then) =
      _$CreateBookingResponseCopyWithImpl<$Res, CreateBookingResponse>;
  @useResult
  $Res call(
      {int? id, int? userId, int? facilityId, String? status, int? price});
}

/// @nodoc
class _$CreateBookingResponseCopyWithImpl<$Res,
        $Val extends CreateBookingResponse>
    implements $CreateBookingResponseCopyWith<$Res> {
  _$CreateBookingResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? facilityId = freezed,
    Object? status = freezed,
    Object? price = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      facilityId: freezed == facilityId
          ? _value.facilityId
          : facilityId // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateBookingResponseImplCopyWith<$Res>
    implements $CreateBookingResponseCopyWith<$Res> {
  factory _$$CreateBookingResponseImplCopyWith(
          _$CreateBookingResponseImpl value,
          $Res Function(_$CreateBookingResponseImpl) then) =
      __$$CreateBookingResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id, int? userId, int? facilityId, String? status, int? price});
}

/// @nodoc
class __$$CreateBookingResponseImplCopyWithImpl<$Res>
    extends _$CreateBookingResponseCopyWithImpl<$Res,
        _$CreateBookingResponseImpl>
    implements _$$CreateBookingResponseImplCopyWith<$Res> {
  __$$CreateBookingResponseImplCopyWithImpl(_$CreateBookingResponseImpl _value,
      $Res Function(_$CreateBookingResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? facilityId = freezed,
    Object? status = freezed,
    Object? price = freezed,
  }) {
    return _then(_$CreateBookingResponseImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      facilityId: freezed == facilityId
          ? _value.facilityId
          : facilityId // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateBookingResponseImpl implements _CreateBookingResponse {
  const _$CreateBookingResponseImpl(
      {required this.id,
      required this.userId,
      required this.facilityId,
      required this.status,
      required this.price});

  factory _$CreateBookingResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateBookingResponseImplFromJson(json);

  @override
  final int? id;
  @override
  final int? userId;
  @override
  final int? facilityId;
  @override
  final String? status;
  @override
  final int? price;

  @override
  String toString() {
    return 'CreateBookingResponse(id: $id, userId: $userId, facilityId: $facilityId, status: $status, price: $price)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateBookingResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.facilityId, facilityId) ||
                other.facilityId == facilityId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.price, price) || other.price == price));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, userId, facilityId, status, price);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateBookingResponseImplCopyWith<_$CreateBookingResponseImpl>
      get copyWith => __$$CreateBookingResponseImplCopyWithImpl<
          _$CreateBookingResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateBookingResponseImplToJson(
      this,
    );
  }
}

abstract class _CreateBookingResponse implements CreateBookingResponse {
  const factory _CreateBookingResponse(
      {required final int? id,
      required final int? userId,
      required final int? facilityId,
      required final String? status,
      required final int? price}) = _$CreateBookingResponseImpl;

  factory _CreateBookingResponse.fromJson(Map<String, dynamic> json) =
      _$CreateBookingResponseImpl.fromJson;

  @override
  int? get id;
  @override
  int? get userId;
  @override
  int? get facilityId;
  @override
  String? get status;
  @override
  int? get price;
  @override
  @JsonKey(ignore: true)
  _$$CreateBookingResponseImplCopyWith<_$CreateBookingResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
