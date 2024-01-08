// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'facility_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FacilityState {
  List<FacilityData> get data => throw _privateConstructorUsedError;
  int get currentPage => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get hasReachedEnd => throw _privateConstructorUsedError;
  List<FacilityData> get favorites => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FacilityStateCopyWith<FacilityState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FacilityStateCopyWith<$Res> {
  factory $FacilityStateCopyWith(
          FacilityState value, $Res Function(FacilityState) then) =
      _$FacilityStateCopyWithImpl<$Res, FacilityState>;
  @useResult
  $Res call(
      {List<FacilityData> data,
      int currentPage,
      bool isLoading,
      bool hasReachedEnd,
      List<FacilityData> favorites});
}

/// @nodoc
class _$FacilityStateCopyWithImpl<$Res, $Val extends FacilityState>
    implements $FacilityStateCopyWith<$Res> {
  _$FacilityStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? currentPage = null,
    Object? isLoading = null,
    Object? hasReachedEnd = null,
    Object? favorites = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<FacilityData>,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasReachedEnd: null == hasReachedEnd
          ? _value.hasReachedEnd
          : hasReachedEnd // ignore: cast_nullable_to_non_nullable
              as bool,
      favorites: null == favorites
          ? _value.favorites
          : favorites // ignore: cast_nullable_to_non_nullable
              as List<FacilityData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FacilityPaginationStateImplCopyWith<$Res>
    implements $FacilityStateCopyWith<$Res> {
  factory _$$FacilityPaginationStateImplCopyWith(
          _$FacilityPaginationStateImpl value,
          $Res Function(_$FacilityPaginationStateImpl) then) =
      __$$FacilityPaginationStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<FacilityData> data,
      int currentPage,
      bool isLoading,
      bool hasReachedEnd,
      List<FacilityData> favorites});
}

/// @nodoc
class __$$FacilityPaginationStateImplCopyWithImpl<$Res>
    extends _$FacilityStateCopyWithImpl<$Res, _$FacilityPaginationStateImpl>
    implements _$$FacilityPaginationStateImplCopyWith<$Res> {
  __$$FacilityPaginationStateImplCopyWithImpl(
      _$FacilityPaginationStateImpl _value,
      $Res Function(_$FacilityPaginationStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? currentPage = null,
    Object? isLoading = null,
    Object? hasReachedEnd = null,
    Object? favorites = null,
  }) {
    return _then(_$FacilityPaginationStateImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<FacilityData>,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasReachedEnd: null == hasReachedEnd
          ? _value.hasReachedEnd
          : hasReachedEnd // ignore: cast_nullable_to_non_nullable
              as bool,
      favorites: null == favorites
          ? _value._favorites
          : favorites // ignore: cast_nullable_to_non_nullable
              as List<FacilityData>,
    ));
  }
}

/// @nodoc

class _$FacilityPaginationStateImpl implements _FacilityPaginationState {
  const _$FacilityPaginationStateImpl(
      {final List<FacilityData> data = const [],
      this.currentPage = 1,
      this.isLoading = false,
      this.hasReachedEnd = false,
      final List<FacilityData> favorites = const []})
      : _data = data,
        _favorites = favorites;

  final List<FacilityData> _data;
  @override
  @JsonKey()
  List<FacilityData> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  @JsonKey()
  final int currentPage;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool hasReachedEnd;
  final List<FacilityData> _favorites;
  @override
  @JsonKey()
  List<FacilityData> get favorites {
    if (_favorites is EqualUnmodifiableListView) return _favorites;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_favorites);
  }

  @override
  String toString() {
    return 'FacilityState(data: $data, currentPage: $currentPage, isLoading: $isLoading, hasReachedEnd: $hasReachedEnd, favorites: $favorites)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FacilityPaginationStateImpl &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.hasReachedEnd, hasReachedEnd) ||
                other.hasReachedEnd == hasReachedEnd) &&
            const DeepCollectionEquality()
                .equals(other._favorites, _favorites));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_data),
      currentPage,
      isLoading,
      hasReachedEnd,
      const DeepCollectionEquality().hash(_favorites));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FacilityPaginationStateImplCopyWith<_$FacilityPaginationStateImpl>
      get copyWith => __$$FacilityPaginationStateImplCopyWithImpl<
          _$FacilityPaginationStateImpl>(this, _$identity);
}

abstract class _FacilityPaginationState implements FacilityState {
  const factory _FacilityPaginationState(
      {final List<FacilityData> data,
      final int currentPage,
      final bool isLoading,
      final bool hasReachedEnd,
      final List<FacilityData> favorites}) = _$FacilityPaginationStateImpl;

  @override
  List<FacilityData> get data;
  @override
  int get currentPage;
  @override
  bool get isLoading;
  @override
  bool get hasReachedEnd;
  @override
  List<FacilityData> get favorites;
  @override
  @JsonKey(ignore: true)
  _$$FacilityPaginationStateImplCopyWith<_$FacilityPaginationStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
