// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking_time_slots_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BookingTimeSlotsModel _$BookingTimeSlotsModelFromJson(
    Map<String, dynamic> json) {
  return _BookingTimeSlotsModel.fromJson(json);
}

/// @nodoc
mixin _$BookingTimeSlotsModel {
  int get id => throw _privateConstructorUsedError;
  int get dayOfWeek => throw _privateConstructorUsedError;
  DateTime get startTime => throw _privateConstructorUsedError;
  DateTime get endTime => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BookingTimeSlotsModelCopyWith<BookingTimeSlotsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookingTimeSlotsModelCopyWith<$Res> {
  factory $BookingTimeSlotsModelCopyWith(BookingTimeSlotsModel value,
          $Res Function(BookingTimeSlotsModel) then) =
      _$BookingTimeSlotsModelCopyWithImpl<$Res, BookingTimeSlotsModel>;
  @useResult
  $Res call(
      {int id,
      int dayOfWeek,
      DateTime startTime,
      DateTime endTime,
      double price,
      String status});
}

/// @nodoc
class _$BookingTimeSlotsModelCopyWithImpl<$Res,
        $Val extends BookingTimeSlotsModel>
    implements $BookingTimeSlotsModelCopyWith<$Res> {
  _$BookingTimeSlotsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? dayOfWeek = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? price = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      dayOfWeek: null == dayOfWeek
          ? _value.dayOfWeek
          : dayOfWeek // ignore: cast_nullable_to_non_nullable
              as int,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BookingTimeSlotsModelImplCopyWith<$Res>
    implements $BookingTimeSlotsModelCopyWith<$Res> {
  factory _$$BookingTimeSlotsModelImplCopyWith(
          _$BookingTimeSlotsModelImpl value,
          $Res Function(_$BookingTimeSlotsModelImpl) then) =
      __$$BookingTimeSlotsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int dayOfWeek,
      DateTime startTime,
      DateTime endTime,
      double price,
      String status});
}

/// @nodoc
class __$$BookingTimeSlotsModelImplCopyWithImpl<$Res>
    extends _$BookingTimeSlotsModelCopyWithImpl<$Res,
        _$BookingTimeSlotsModelImpl>
    implements _$$BookingTimeSlotsModelImplCopyWith<$Res> {
  __$$BookingTimeSlotsModelImplCopyWithImpl(_$BookingTimeSlotsModelImpl _value,
      $Res Function(_$BookingTimeSlotsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? dayOfWeek = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? price = null,
    Object? status = null,
  }) {
    return _then(_$BookingTimeSlotsModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      dayOfWeek: null == dayOfWeek
          ? _value.dayOfWeek
          : dayOfWeek // ignore: cast_nullable_to_non_nullable
              as int,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BookingTimeSlotsModelImpl implements _BookingTimeSlotsModel {
  const _$BookingTimeSlotsModelImpl(
      {required this.id,
      required this.dayOfWeek,
      required this.startTime,
      required this.endTime,
      required this.price,
      required this.status});

  factory _$BookingTimeSlotsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BookingTimeSlotsModelImplFromJson(json);

  @override
  final int id;
  @override
  final int dayOfWeek;
  @override
  final DateTime startTime;
  @override
  final DateTime endTime;
  @override
  final double price;
  @override
  final String status;

  @override
  String toString() {
    return 'BookingTimeSlotsModel(id: $id, dayOfWeek: $dayOfWeek, startTime: $startTime, endTime: $endTime, price: $price, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookingTimeSlotsModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.dayOfWeek, dayOfWeek) ||
                other.dayOfWeek == dayOfWeek) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, dayOfWeek, startTime, endTime, price, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BookingTimeSlotsModelImplCopyWith<_$BookingTimeSlotsModelImpl>
      get copyWith => __$$BookingTimeSlotsModelImplCopyWithImpl<
          _$BookingTimeSlotsModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BookingTimeSlotsModelImplToJson(
      this,
    );
  }
}

abstract class _BookingTimeSlotsModel implements BookingTimeSlotsModel {
  const factory _BookingTimeSlotsModel(
      {required final int id,
      required final int dayOfWeek,
      required final DateTime startTime,
      required final DateTime endTime,
      required final double price,
      required final String status}) = _$BookingTimeSlotsModelImpl;

  factory _BookingTimeSlotsModel.fromJson(Map<String, dynamic> json) =
      _$BookingTimeSlotsModelImpl.fromJson;

  @override
  int get id;
  @override
  int get dayOfWeek;
  @override
  DateTime get startTime;
  @override
  DateTime get endTime;
  @override
  double get price;
  @override
  String get status;
  @override
  @JsonKey(ignore: true)
  _$$BookingTimeSlotsModelImplCopyWith<_$BookingTimeSlotsModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
