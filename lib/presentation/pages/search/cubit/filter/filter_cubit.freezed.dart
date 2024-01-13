// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'filter_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FilterState {
  String? get selectedSportType => throw _privateConstructorUsedError;
  String? get selectedCoveringType => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FilterStateCopyWith<FilterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FilterStateCopyWith<$Res> {
  factory $FilterStateCopyWith(
          FilterState value, $Res Function(FilterState) then) =
      _$FilterStateCopyWithImpl<$Res, FilterState>;
  @useResult
  $Res call({String? selectedSportType, String? selectedCoveringType});
}

/// @nodoc
class _$FilterStateCopyWithImpl<$Res, $Val extends FilterState>
    implements $FilterStateCopyWith<$Res> {
  _$FilterStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedSportType = freezed,
    Object? selectedCoveringType = freezed,
  }) {
    return _then(_value.copyWith(
      selectedSportType: freezed == selectedSportType
          ? _value.selectedSportType
          : selectedSportType // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedCoveringType: freezed == selectedCoveringType
          ? _value.selectedCoveringType
          : selectedCoveringType // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FilterStateImplCopyWith<$Res>
    implements $FilterStateCopyWith<$Res> {
  factory _$$FilterStateImplCopyWith(
          _$FilterStateImpl value, $Res Function(_$FilterStateImpl) then) =
      __$$FilterStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? selectedSportType, String? selectedCoveringType});
}

/// @nodoc
class __$$FilterStateImplCopyWithImpl<$Res>
    extends _$FilterStateCopyWithImpl<$Res, _$FilterStateImpl>
    implements _$$FilterStateImplCopyWith<$Res> {
  __$$FilterStateImplCopyWithImpl(
      _$FilterStateImpl _value, $Res Function(_$FilterStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedSportType = freezed,
    Object? selectedCoveringType = freezed,
  }) {
    return _then(_$FilterStateImpl(
      selectedSportType: freezed == selectedSportType
          ? _value.selectedSportType
          : selectedSportType // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedCoveringType: freezed == selectedCoveringType
          ? _value.selectedCoveringType
          : selectedCoveringType // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$FilterStateImpl implements _FilterState {
  const _$FilterStateImpl({this.selectedSportType, this.selectedCoveringType});

  @override
  final String? selectedSportType;
  @override
  final String? selectedCoveringType;

  @override
  String toString() {
    return 'FilterState(selectedSportType: $selectedSportType, selectedCoveringType: $selectedCoveringType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilterStateImpl &&
            (identical(other.selectedSportType, selectedSportType) ||
                other.selectedSportType == selectedSportType) &&
            (identical(other.selectedCoveringType, selectedCoveringType) ||
                other.selectedCoveringType == selectedCoveringType));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, selectedSportType, selectedCoveringType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FilterStateImplCopyWith<_$FilterStateImpl> get copyWith =>
      __$$FilterStateImplCopyWithImpl<_$FilterStateImpl>(this, _$identity);
}

abstract class _FilterState implements FilterState {
  const factory _FilterState(
      {final String? selectedSportType,
      final String? selectedCoveringType}) = _$FilterStateImpl;

  @override
  String? get selectedSportType;
  @override
  String? get selectedCoveringType;
  @override
  @JsonKey(ignore: true)
  _$$FilterStateImplCopyWith<_$FilterStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
