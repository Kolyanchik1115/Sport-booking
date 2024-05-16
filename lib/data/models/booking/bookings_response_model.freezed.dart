// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bookings_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BookingsResponseModel _$BookingsResponseModelFromJson(
    Map<String, dynamic> json) {
  return _BookingsResponseModel.fromJson(json);
}

/// @nodoc
mixin _$BookingsResponseModel {
  List<BookingModel> get bookings => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BookingsResponseModelCopyWith<BookingsResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookingsResponseModelCopyWith<$Res> {
  factory $BookingsResponseModelCopyWith(BookingsResponseModel value,
          $Res Function(BookingsResponseModel) then) =
      _$BookingsResponseModelCopyWithImpl<$Res, BookingsResponseModel>;
  @useResult
  $Res call({List<BookingModel> bookings});
}

/// @nodoc
class _$BookingsResponseModelCopyWithImpl<$Res,
        $Val extends BookingsResponseModel>
    implements $BookingsResponseModelCopyWith<$Res> {
  _$BookingsResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookings = null,
  }) {
    return _then(_value.copyWith(
      bookings: null == bookings
          ? _value.bookings
          : bookings // ignore: cast_nullable_to_non_nullable
              as List<BookingModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BookingsResponseModelImplCopyWith<$Res>
    implements $BookingsResponseModelCopyWith<$Res> {
  factory _$$BookingsResponseModelImplCopyWith(
          _$BookingsResponseModelImpl value,
          $Res Function(_$BookingsResponseModelImpl) then) =
      __$$BookingsResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<BookingModel> bookings});
}

/// @nodoc
class __$$BookingsResponseModelImplCopyWithImpl<$Res>
    extends _$BookingsResponseModelCopyWithImpl<$Res,
        _$BookingsResponseModelImpl>
    implements _$$BookingsResponseModelImplCopyWith<$Res> {
  __$$BookingsResponseModelImplCopyWithImpl(_$BookingsResponseModelImpl _value,
      $Res Function(_$BookingsResponseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookings = null,
  }) {
    return _then(_$BookingsResponseModelImpl(
      bookings: null == bookings
          ? _value._bookings
          : bookings // ignore: cast_nullable_to_non_nullable
              as List<BookingModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BookingsResponseModelImpl implements _BookingsResponseModel {
  const _$BookingsResponseModelImpl(
      {required final List<BookingModel> bookings})
      : _bookings = bookings;

  factory _$BookingsResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BookingsResponseModelImplFromJson(json);

  final List<BookingModel> _bookings;
  @override
  List<BookingModel> get bookings {
    if (_bookings is EqualUnmodifiableListView) return _bookings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bookings);
  }

  @override
  String toString() {
    return 'BookingsResponseModel(bookings: $bookings)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookingsResponseModelImpl &&
            const DeepCollectionEquality().equals(other._bookings, _bookings));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_bookings));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BookingsResponseModelImplCopyWith<_$BookingsResponseModelImpl>
      get copyWith => __$$BookingsResponseModelImplCopyWithImpl<
          _$BookingsResponseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BookingsResponseModelImplToJson(
      this,
    );
  }
}

abstract class _BookingsResponseModel implements BookingsResponseModel {
  const factory _BookingsResponseModel(
          {required final List<BookingModel> bookings}) =
      _$BookingsResponseModelImpl;

  factory _BookingsResponseModel.fromJson(Map<String, dynamic> json) =
      _$BookingsResponseModelImpl.fromJson;

  @override
  List<BookingModel> get bookings;
  @override
  @JsonKey(ignore: true)
  _$$BookingsResponseModelImplCopyWith<_$BookingsResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
