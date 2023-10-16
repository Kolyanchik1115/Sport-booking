// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_profile_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserProfileResponseModel _$UserProfileResponseModelFromJson(
    Map<String, dynamic> json) {
  return _UserProfileResponseModel.fromJson(json);
}

/// @nodoc
mixin _$UserProfileResponseModel {
  UserData get getProfile => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserProfileResponseModelCopyWith<UserProfileResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProfileResponseModelCopyWith<$Res> {
  factory $UserProfileResponseModelCopyWith(UserProfileResponseModel value,
          $Res Function(UserProfileResponseModel) then) =
      _$UserProfileResponseModelCopyWithImpl<$Res, UserProfileResponseModel>;
  @useResult
  $Res call({UserData getProfile});

  $UserDataCopyWith<$Res> get getProfile;
}

/// @nodoc
class _$UserProfileResponseModelCopyWithImpl<$Res,
        $Val extends UserProfileResponseModel>
    implements $UserProfileResponseModelCopyWith<$Res> {
  _$UserProfileResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? getProfile = null,
  }) {
    return _then(_value.copyWith(
      getProfile: null == getProfile
          ? _value.getProfile
          : getProfile // ignore: cast_nullable_to_non_nullable
              as UserData,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserDataCopyWith<$Res> get getProfile {
    return $UserDataCopyWith<$Res>(_value.getProfile, (value) {
      return _then(_value.copyWith(getProfile: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserProfileResponseModelImplCopyWith<$Res>
    implements $UserProfileResponseModelCopyWith<$Res> {
  factory _$$UserProfileResponseModelImplCopyWith(
          _$UserProfileResponseModelImpl value,
          $Res Function(_$UserProfileResponseModelImpl) then) =
      __$$UserProfileResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({UserData getProfile});

  @override
  $UserDataCopyWith<$Res> get getProfile;
}

/// @nodoc
class __$$UserProfileResponseModelImplCopyWithImpl<$Res>
    extends _$UserProfileResponseModelCopyWithImpl<$Res,
        _$UserProfileResponseModelImpl>
    implements _$$UserProfileResponseModelImplCopyWith<$Res> {
  __$$UserProfileResponseModelImplCopyWithImpl(
      _$UserProfileResponseModelImpl _value,
      $Res Function(_$UserProfileResponseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? getProfile = null,
  }) {
    return _then(_$UserProfileResponseModelImpl(
      getProfile: null == getProfile
          ? _value.getProfile
          : getProfile // ignore: cast_nullable_to_non_nullable
              as UserData,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserProfileResponseModelImpl implements _UserProfileResponseModel {
  const _$UserProfileResponseModelImpl({required this.getProfile});

  factory _$UserProfileResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserProfileResponseModelImplFromJson(json);

  @override
  final UserData getProfile;

  @override
  String toString() {
    return 'UserProfileResponseModel(getProfile: $getProfile)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserProfileResponseModelImpl &&
            (identical(other.getProfile, getProfile) ||
                other.getProfile == getProfile));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, getProfile);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserProfileResponseModelImplCopyWith<_$UserProfileResponseModelImpl>
      get copyWith => __$$UserProfileResponseModelImplCopyWithImpl<
          _$UserProfileResponseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserProfileResponseModelImplToJson(
      this,
    );
  }
}

abstract class _UserProfileResponseModel implements UserProfileResponseModel {
  const factory _UserProfileResponseModel(
      {required final UserData getProfile}) = _$UserProfileResponseModelImpl;

  factory _UserProfileResponseModel.fromJson(Map<String, dynamic> json) =
      _$UserProfileResponseModelImpl.fromJson;

  @override
  UserData get getProfile;
  @override
  @JsonKey(ignore: true)
  _$$UserProfileResponseModelImplCopyWith<_$UserProfileResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
