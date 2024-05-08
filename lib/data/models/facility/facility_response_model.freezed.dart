// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'facility_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FacilityResponseModel _$FacilityResponseModelFromJson(
    Map<String, dynamic> json) {
  return _FacilityResponseModel.fromJson(json);
}

/// @nodoc
mixin _$FacilityResponseModel {
  FacilityResponse? get findAll => throw _privateConstructorUsedError;
  FacilityResponse? get getUserFavorites => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FacilityResponseModelCopyWith<FacilityResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FacilityResponseModelCopyWith<$Res> {
  factory $FacilityResponseModelCopyWith(FacilityResponseModel value,
          $Res Function(FacilityResponseModel) then) =
      _$FacilityResponseModelCopyWithImpl<$Res, FacilityResponseModel>;
  @useResult
  $Res call({FacilityResponse? findAll, FacilityResponse? getUserFavorites});

  $FacilityResponseCopyWith<$Res>? get findAll;
  $FacilityResponseCopyWith<$Res>? get getUserFavorites;
}

/// @nodoc
class _$FacilityResponseModelCopyWithImpl<$Res,
        $Val extends FacilityResponseModel>
    implements $FacilityResponseModelCopyWith<$Res> {
  _$FacilityResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? findAll = freezed,
    Object? getUserFavorites = freezed,
  }) {
    return _then(_value.copyWith(
      findAll: freezed == findAll
          ? _value.findAll
          : findAll // ignore: cast_nullable_to_non_nullable
              as FacilityResponse?,
      getUserFavorites: freezed == getUserFavorites
          ? _value.getUserFavorites
          : getUserFavorites // ignore: cast_nullable_to_non_nullable
              as FacilityResponse?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FacilityResponseCopyWith<$Res>? get findAll {
    if (_value.findAll == null) {
      return null;
    }

    return $FacilityResponseCopyWith<$Res>(_value.findAll!, (value) {
      return _then(_value.copyWith(findAll: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $FacilityResponseCopyWith<$Res>? get getUserFavorites {
    if (_value.getUserFavorites == null) {
      return null;
    }

    return $FacilityResponseCopyWith<$Res>(_value.getUserFavorites!, (value) {
      return _then(_value.copyWith(getUserFavorites: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FacilityResponseModelImplCopyWith<$Res>
    implements $FacilityResponseModelCopyWith<$Res> {
  factory _$$FacilityResponseModelImplCopyWith(
          _$FacilityResponseModelImpl value,
          $Res Function(_$FacilityResponseModelImpl) then) =
      __$$FacilityResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({FacilityResponse? findAll, FacilityResponse? getUserFavorites});

  @override
  $FacilityResponseCopyWith<$Res>? get findAll;
  @override
  $FacilityResponseCopyWith<$Res>? get getUserFavorites;
}

/// @nodoc
class __$$FacilityResponseModelImplCopyWithImpl<$Res>
    extends _$FacilityResponseModelCopyWithImpl<$Res,
        _$FacilityResponseModelImpl>
    implements _$$FacilityResponseModelImplCopyWith<$Res> {
  __$$FacilityResponseModelImplCopyWithImpl(_$FacilityResponseModelImpl _value,
      $Res Function(_$FacilityResponseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? findAll = freezed,
    Object? getUserFavorites = freezed,
  }) {
    return _then(_$FacilityResponseModelImpl(
      findAll: freezed == findAll
          ? _value.findAll
          : findAll // ignore: cast_nullable_to_non_nullable
              as FacilityResponse?,
      getUserFavorites: freezed == getUserFavorites
          ? _value.getUserFavorites
          : getUserFavorites // ignore: cast_nullable_to_non_nullable
              as FacilityResponse?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FacilityResponseModelImpl implements _FacilityResponseModel {
  const _$FacilityResponseModelImpl(
      {required this.findAll, required this.getUserFavorites});

  factory _$FacilityResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FacilityResponseModelImplFromJson(json);

  @override
  final FacilityResponse? findAll;
  @override
  final FacilityResponse? getUserFavorites;

  @override
  String toString() {
    return 'FacilityResponseModel(findAll: $findAll, getUserFavorites: $getUserFavorites)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FacilityResponseModelImpl &&
            (identical(other.findAll, findAll) || other.findAll == findAll) &&
            (identical(other.getUserFavorites, getUserFavorites) ||
                other.getUserFavorites == getUserFavorites));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, findAll, getUserFavorites);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FacilityResponseModelImplCopyWith<_$FacilityResponseModelImpl>
      get copyWith => __$$FacilityResponseModelImplCopyWithImpl<
          _$FacilityResponseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FacilityResponseModelImplToJson(
      this,
    );
  }
}

abstract class _FacilityResponseModel implements FacilityResponseModel {
  const factory _FacilityResponseModel(
          {required final FacilityResponse? findAll,
          required final FacilityResponse? getUserFavorites}) =
      _$FacilityResponseModelImpl;

  factory _FacilityResponseModel.fromJson(Map<String, dynamic> json) =
      _$FacilityResponseModelImpl.fromJson;

  @override
  FacilityResponse? get findAll;
  @override
  FacilityResponse? get getUserFavorites;
  @override
  @JsonKey(ignore: true)
  _$$FacilityResponseModelImplCopyWith<_$FacilityResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
