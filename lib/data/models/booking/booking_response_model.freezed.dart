// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BookingResponseModel _$BookingResponseModelFromJson(Map<String, dynamic> json) {
  return _BookingResponseModel.fromJson(json);
}

/// @nodoc
mixin _$BookingResponseModel {
  BookingResponse? get facility => throw _privateConstructorUsedError;
  CreateBookingResponse? get createBooking =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BookingResponseModelCopyWith<BookingResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookingResponseModelCopyWith<$Res> {
  factory $BookingResponseModelCopyWith(BookingResponseModel value,
          $Res Function(BookingResponseModel) then) =
      _$BookingResponseModelCopyWithImpl<$Res, BookingResponseModel>;
  @useResult
  $Res call({BookingResponse? facility, CreateBookingResponse? createBooking});

  $BookingResponseCopyWith<$Res>? get facility;
  $CreateBookingResponseCopyWith<$Res>? get createBooking;
}

/// @nodoc
class _$BookingResponseModelCopyWithImpl<$Res,
        $Val extends BookingResponseModel>
    implements $BookingResponseModelCopyWith<$Res> {
  _$BookingResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? facility = freezed,
    Object? createBooking = freezed,
  }) {
    return _then(_value.copyWith(
      facility: freezed == facility
          ? _value.facility
          : facility // ignore: cast_nullable_to_non_nullable
              as BookingResponse?,
      createBooking: freezed == createBooking
          ? _value.createBooking
          : createBooking // ignore: cast_nullable_to_non_nullable
              as CreateBookingResponse?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $BookingResponseCopyWith<$Res>? get facility {
    if (_value.facility == null) {
      return null;
    }

    return $BookingResponseCopyWith<$Res>(_value.facility!, (value) {
      return _then(_value.copyWith(facility: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CreateBookingResponseCopyWith<$Res>? get createBooking {
    if (_value.createBooking == null) {
      return null;
    }

    return $CreateBookingResponseCopyWith<$Res>(_value.createBooking!, (value) {
      return _then(_value.copyWith(createBooking: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BookingResponseModelImplCopyWith<$Res>
    implements $BookingResponseModelCopyWith<$Res> {
  factory _$$BookingResponseModelImplCopyWith(_$BookingResponseModelImpl value,
          $Res Function(_$BookingResponseModelImpl) then) =
      __$$BookingResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BookingResponse? facility, CreateBookingResponse? createBooking});

  @override
  $BookingResponseCopyWith<$Res>? get facility;
  @override
  $CreateBookingResponseCopyWith<$Res>? get createBooking;
}

/// @nodoc
class __$$BookingResponseModelImplCopyWithImpl<$Res>
    extends _$BookingResponseModelCopyWithImpl<$Res, _$BookingResponseModelImpl>
    implements _$$BookingResponseModelImplCopyWith<$Res> {
  __$$BookingResponseModelImplCopyWithImpl(_$BookingResponseModelImpl _value,
      $Res Function(_$BookingResponseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? facility = freezed,
    Object? createBooking = freezed,
  }) {
    return _then(_$BookingResponseModelImpl(
      facility: freezed == facility
          ? _value.facility
          : facility // ignore: cast_nullable_to_non_nullable
              as BookingResponse?,
      createBooking: freezed == createBooking
          ? _value.createBooking
          : createBooking // ignore: cast_nullable_to_non_nullable
              as CreateBookingResponse?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BookingResponseModelImpl implements _BookingResponseModel {
  const _$BookingResponseModelImpl({this.facility, this.createBooking});

  factory _$BookingResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BookingResponseModelImplFromJson(json);

  @override
  final BookingResponse? facility;
  @override
  final CreateBookingResponse? createBooking;

  @override
  String toString() {
    return 'BookingResponseModel(facility: $facility, createBooking: $createBooking)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookingResponseModelImpl &&
            (identical(other.facility, facility) ||
                other.facility == facility) &&
            (identical(other.createBooking, createBooking) ||
                other.createBooking == createBooking));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, facility, createBooking);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BookingResponseModelImplCopyWith<_$BookingResponseModelImpl>
      get copyWith =>
          __$$BookingResponseModelImplCopyWithImpl<_$BookingResponseModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BookingResponseModelImplToJson(
      this,
    );
  }
}

abstract class _BookingResponseModel implements BookingResponseModel {
  const factory _BookingResponseModel(
      {final BookingResponse? facility,
      final CreateBookingResponse? createBooking}) = _$BookingResponseModelImpl;

  factory _BookingResponseModel.fromJson(Map<String, dynamic> json) =
      _$BookingResponseModelImpl.fromJson;

  @override
  BookingResponse? get facility;
  @override
  CreateBookingResponse? get createBooking;
  @override
  @JsonKey(ignore: true)
  _$$BookingResponseModelImplCopyWith<_$BookingResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
