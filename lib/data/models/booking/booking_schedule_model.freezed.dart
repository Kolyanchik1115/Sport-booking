// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking_schedule_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BookingScheduleModel _$BookingScheduleModelFromJson(Map<String, dynamic> json) {
  return _BookingScheduleModel.fromJson(json);
}

/// @nodoc
mixin _$BookingScheduleModel {
  DateTime get date => throw _privateConstructorUsedError;
  List<BookingTimeSlotsModel> get timeSlots =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BookingScheduleModelCopyWith<BookingScheduleModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookingScheduleModelCopyWith<$Res> {
  factory $BookingScheduleModelCopyWith(BookingScheduleModel value,
          $Res Function(BookingScheduleModel) then) =
      _$BookingScheduleModelCopyWithImpl<$Res, BookingScheduleModel>;
  @useResult
  $Res call({DateTime date, List<BookingTimeSlotsModel> timeSlots});
}

/// @nodoc
class _$BookingScheduleModelCopyWithImpl<$Res,
        $Val extends BookingScheduleModel>
    implements $BookingScheduleModelCopyWith<$Res> {
  _$BookingScheduleModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? timeSlots = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      timeSlots: null == timeSlots
          ? _value.timeSlots
          : timeSlots // ignore: cast_nullable_to_non_nullable
              as List<BookingTimeSlotsModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BookingScheduleModelImplCopyWith<$Res>
    implements $BookingScheduleModelCopyWith<$Res> {
  factory _$$BookingScheduleModelImplCopyWith(_$BookingScheduleModelImpl value,
          $Res Function(_$BookingScheduleModelImpl) then) =
      __$$BookingScheduleModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime date, List<BookingTimeSlotsModel> timeSlots});
}

/// @nodoc
class __$$BookingScheduleModelImplCopyWithImpl<$Res>
    extends _$BookingScheduleModelCopyWithImpl<$Res, _$BookingScheduleModelImpl>
    implements _$$BookingScheduleModelImplCopyWith<$Res> {
  __$$BookingScheduleModelImplCopyWithImpl(_$BookingScheduleModelImpl _value,
      $Res Function(_$BookingScheduleModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? timeSlots = null,
  }) {
    return _then(_$BookingScheduleModelImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      timeSlots: null == timeSlots
          ? _value._timeSlots
          : timeSlots // ignore: cast_nullable_to_non_nullable
              as List<BookingTimeSlotsModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BookingScheduleModelImpl implements _BookingScheduleModel {
  const _$BookingScheduleModelImpl(
      {required this.date,
      required final List<BookingTimeSlotsModel> timeSlots})
      : _timeSlots = timeSlots;

  factory _$BookingScheduleModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BookingScheduleModelImplFromJson(json);

  @override
  final DateTime date;
  final List<BookingTimeSlotsModel> _timeSlots;
  @override
  List<BookingTimeSlotsModel> get timeSlots {
    if (_timeSlots is EqualUnmodifiableListView) return _timeSlots;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_timeSlots);
  }

  @override
  String toString() {
    return 'BookingScheduleModel(date: $date, timeSlots: $timeSlots)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookingScheduleModelImpl &&
            (identical(other.date, date) || other.date == date) &&
            const DeepCollectionEquality()
                .equals(other._timeSlots, _timeSlots));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, date, const DeepCollectionEquality().hash(_timeSlots));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BookingScheduleModelImplCopyWith<_$BookingScheduleModelImpl>
      get copyWith =>
          __$$BookingScheduleModelImplCopyWithImpl<_$BookingScheduleModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BookingScheduleModelImplToJson(
      this,
    );
  }
}

abstract class _BookingScheduleModel implements BookingScheduleModel {
  const factory _BookingScheduleModel(
          {required final DateTime date,
          required final List<BookingTimeSlotsModel> timeSlots}) =
      _$BookingScheduleModelImpl;

  factory _BookingScheduleModel.fromJson(Map<String, dynamic> json) =
      _$BookingScheduleModelImpl.fromJson;

  @override
  DateTime get date;
  @override
  List<BookingTimeSlotsModel> get timeSlots;
  @override
  @JsonKey(ignore: true)
  _$$BookingScheduleModelImplCopyWith<_$BookingScheduleModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
