// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favorite_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FavoriteState {
  String? get errorMessage => throw _privateConstructorUsedError;
  bool? get isLoading => throw _privateConstructorUsedError;
  int? get updatedFacilityId => throw _privateConstructorUsedError;
  bool? get updatedStatus => throw _privateConstructorUsedError;
  List<FacilityData> get data => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FavoriteStateCopyWith<FavoriteState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoriteStateCopyWith<$Res> {
  factory $FavoriteStateCopyWith(
          FavoriteState value, $Res Function(FavoriteState) then) =
      _$FavoriteStateCopyWithImpl<$Res, FavoriteState>;
  @useResult
  $Res call(
      {String? errorMessage,
      bool? isLoading,
      int? updatedFacilityId,
      bool? updatedStatus,
      List<FacilityData> data});
}

/// @nodoc
class _$FavoriteStateCopyWithImpl<$Res, $Val extends FavoriteState>
    implements $FavoriteStateCopyWith<$Res> {
  _$FavoriteStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = freezed,
    Object? isLoading = freezed,
    Object? updatedFacilityId = freezed,
    Object? updatedStatus = freezed,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      isLoading: freezed == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool?,
      updatedFacilityId: freezed == updatedFacilityId
          ? _value.updatedFacilityId
          : updatedFacilityId // ignore: cast_nullable_to_non_nullable
              as int?,
      updatedStatus: freezed == updatedStatus
          ? _value.updatedStatus
          : updatedStatus // ignore: cast_nullable_to_non_nullable
              as bool?,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<FacilityData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FavoriteStateImplCopyWith<$Res>
    implements $FavoriteStateCopyWith<$Res> {
  factory _$$FavoriteStateImplCopyWith(
          _$FavoriteStateImpl value, $Res Function(_$FavoriteStateImpl) then) =
      __$$FavoriteStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? errorMessage,
      bool? isLoading,
      int? updatedFacilityId,
      bool? updatedStatus,
      List<FacilityData> data});
}

/// @nodoc
class __$$FavoriteStateImplCopyWithImpl<$Res>
    extends _$FavoriteStateCopyWithImpl<$Res, _$FavoriteStateImpl>
    implements _$$FavoriteStateImplCopyWith<$Res> {
  __$$FavoriteStateImplCopyWithImpl(
      _$FavoriteStateImpl _value, $Res Function(_$FavoriteStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = freezed,
    Object? isLoading = freezed,
    Object? updatedFacilityId = freezed,
    Object? updatedStatus = freezed,
    Object? data = null,
  }) {
    return _then(_$FavoriteStateImpl(
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      isLoading: freezed == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool?,
      updatedFacilityId: freezed == updatedFacilityId
          ? _value.updatedFacilityId
          : updatedFacilityId // ignore: cast_nullable_to_non_nullable
              as int?,
      updatedStatus: freezed == updatedStatus
          ? _value.updatedStatus
          : updatedStatus // ignore: cast_nullable_to_non_nullable
              as bool?,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<FacilityData>,
    ));
  }
}

/// @nodoc

class _$FavoriteStateImpl implements _FavoriteState {
  const _$FavoriteStateImpl(
      {this.errorMessage,
      this.isLoading,
      this.updatedFacilityId,
      this.updatedStatus,
      final List<FacilityData> data = const []})
      : _data = data;

  @override
  final String? errorMessage;
  @override
  final bool? isLoading;
  @override
  final int? updatedFacilityId;
  @override
  final bool? updatedStatus;
  final List<FacilityData> _data;
  @override
  @JsonKey()
  List<FacilityData> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'FavoriteState(errorMessage: $errorMessage, isLoading: $isLoading, updatedFacilityId: $updatedFacilityId, updatedStatus: $updatedStatus, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FavoriteStateImpl &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.updatedFacilityId, updatedFacilityId) ||
                other.updatedFacilityId == updatedFacilityId) &&
            (identical(other.updatedStatus, updatedStatus) ||
                other.updatedStatus == updatedStatus) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      errorMessage,
      isLoading,
      updatedFacilityId,
      updatedStatus,
      const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FavoriteStateImplCopyWith<_$FavoriteStateImpl> get copyWith =>
      __$$FavoriteStateImplCopyWithImpl<_$FavoriteStateImpl>(this, _$identity);
}

abstract class _FavoriteState implements FavoriteState {
  const factory _FavoriteState(
      {final String? errorMessage,
      final bool? isLoading,
      final int? updatedFacilityId,
      final bool? updatedStatus,
      final List<FacilityData> data}) = _$FavoriteStateImpl;

  @override
  String? get errorMessage;
  @override
  bool? get isLoading;
  @override
  int? get updatedFacilityId;
  @override
  bool? get updatedStatus;
  @override
  List<FacilityData> get data;
  @override
  @JsonKey(ignore: true)
  _$$FavoriteStateImplCopyWith<_$FavoriteStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
