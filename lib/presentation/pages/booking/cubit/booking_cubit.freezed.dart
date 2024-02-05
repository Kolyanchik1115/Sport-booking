// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BookingState {
  dynamic get price => throw _privateConstructorUsedError;
  List<DateTime> get dates => throw _privateConstructorUsedError;
  List<int> get cells => throw _privateConstructorUsedError;
  List<BookingTimeSlotsModel> get timeSlots =>
      throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BookingStateCopyWith<BookingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookingStateCopyWith<$Res> {
  factory $BookingStateCopyWith(
          BookingState value, $Res Function(BookingState) then) =
      _$BookingStateCopyWithImpl<$Res, BookingState>;
  @useResult
  $Res call(
      {dynamic price,
      List<DateTime> dates,
      List<int> cells,
      List<BookingTimeSlotsModel> timeSlots,
      bool isLoading,
      String? errorMessage});
}

/// @nodoc
class _$BookingStateCopyWithImpl<$Res, $Val extends BookingState>
    implements $BookingStateCopyWith<$Res> {
  _$BookingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? price = freezed,
    Object? dates = null,
    Object? cells = null,
    Object? timeSlots = null,
    Object? isLoading = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as dynamic,
      dates: null == dates
          ? _value.dates
          : dates // ignore: cast_nullable_to_non_nullable
              as List<DateTime>,
      cells: null == cells
          ? _value.cells
          : cells // ignore: cast_nullable_to_non_nullable
              as List<int>,
      timeSlots: null == timeSlots
          ? _value.timeSlots
          : timeSlots // ignore: cast_nullable_to_non_nullable
              as List<BookingTimeSlotsModel>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BookingStateImplCopyWith<$Res>
    implements $BookingStateCopyWith<$Res> {
  factory _$$BookingStateImplCopyWith(
          _$BookingStateImpl value, $Res Function(_$BookingStateImpl) then) =
      __$$BookingStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {dynamic price,
      List<DateTime> dates,
      List<int> cells,
      List<BookingTimeSlotsModel> timeSlots,
      bool isLoading,
      String? errorMessage});
}

/// @nodoc
class __$$BookingStateImplCopyWithImpl<$Res>
    extends _$BookingStateCopyWithImpl<$Res, _$BookingStateImpl>
    implements _$$BookingStateImplCopyWith<$Res> {
  __$$BookingStateImplCopyWithImpl(
      _$BookingStateImpl _value, $Res Function(_$BookingStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? price = freezed,
    Object? dates = null,
    Object? cells = null,
    Object? timeSlots = null,
    Object? isLoading = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$BookingStateImpl(
      price: freezed == price ? _value.price! : price,
      dates: null == dates
          ? _value._dates
          : dates // ignore: cast_nullable_to_non_nullable
              as List<DateTime>,
      cells: null == cells
          ? _value._cells
          : cells // ignore: cast_nullable_to_non_nullable
              as List<int>,
      timeSlots: null == timeSlots
          ? _value._timeSlots
          : timeSlots // ignore: cast_nullable_to_non_nullable
              as List<BookingTimeSlotsModel>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$BookingStateImpl implements _BookingState {
  const _$BookingStateImpl(
      {this.price = 0.0,
      final List<DateTime> dates = const [],
      final List<int> cells = const [],
      final List<BookingTimeSlotsModel> timeSlots = const [],
      this.isLoading = false,
      this.errorMessage})
      : _dates = dates,
        _cells = cells,
        _timeSlots = timeSlots;

  @override
  @JsonKey()
  final dynamic price;
  final List<DateTime> _dates;
  @override
  @JsonKey()
  List<DateTime> get dates {
    if (_dates is EqualUnmodifiableListView) return _dates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dates);
  }

  final List<int> _cells;
  @override
  @JsonKey()
  List<int> get cells {
    if (_cells is EqualUnmodifiableListView) return _cells;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cells);
  }

  final List<BookingTimeSlotsModel> _timeSlots;
  @override
  @JsonKey()
  List<BookingTimeSlotsModel> get timeSlots {
    if (_timeSlots is EqualUnmodifiableListView) return _timeSlots;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_timeSlots);
  }

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'BookingState(price: $price, dates: $dates, cells: $cells, timeSlots: $timeSlots, isLoading: $isLoading, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookingStateImpl &&
            const DeepCollectionEquality().equals(other.price, price) &&
            const DeepCollectionEquality().equals(other._dates, _dates) &&
            const DeepCollectionEquality().equals(other._cells, _cells) &&
            const DeepCollectionEquality()
                .equals(other._timeSlots, _timeSlots) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(price),
      const DeepCollectionEquality().hash(_dates),
      const DeepCollectionEquality().hash(_cells),
      const DeepCollectionEquality().hash(_timeSlots),
      isLoading,
      errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BookingStateImplCopyWith<_$BookingStateImpl> get copyWith =>
      __$$BookingStateImplCopyWithImpl<_$BookingStateImpl>(this, _$identity);
}

abstract class _BookingState implements BookingState {
  const factory _BookingState(
      {final dynamic price,
      final List<DateTime> dates,
      final List<int> cells,
      final List<BookingTimeSlotsModel> timeSlots,
      final bool isLoading,
      final String? errorMessage}) = _$BookingStateImpl;

  @override
  dynamic get price;
  @override
  List<DateTime> get dates;
  @override
  List<int> get cells;
  @override
  List<BookingTimeSlotsModel> get timeSlots;
  @override
  bool get isLoading;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$BookingStateImplCopyWith<_$BookingStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
