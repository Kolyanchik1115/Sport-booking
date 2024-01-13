// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserResponseModel _$UserResponseModelFromJson(Map<String, dynamic> json) {
  return _UserResponseModel.fromJson(json);
}

/// @nodoc
mixin _$UserResponseModel {
  UserResponse? get login => throw _privateConstructorUsedError;
  UserResponse? get register => throw _privateConstructorUsedError;
  UserData? get getProfile => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserResponseModelCopyWith<UserResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserResponseModelCopyWith<$Res> {
  factory $UserResponseModelCopyWith(
          UserResponseModel value, $Res Function(UserResponseModel) then) =
      _$UserResponseModelCopyWithImpl<$Res, UserResponseModel>;
  @useResult
  $Res call(
      {UserResponse? login, UserResponse? register, UserData? getProfile});

  $UserResponseCopyWith<$Res>? get login;
  $UserResponseCopyWith<$Res>? get register;
  $UserDataCopyWith<$Res>? get getProfile;
}

/// @nodoc
class _$UserResponseModelCopyWithImpl<$Res, $Val extends UserResponseModel>
    implements $UserResponseModelCopyWith<$Res> {
  _$UserResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? login = freezed,
    Object? register = freezed,
    Object? getProfile = freezed,
  }) {
    return _then(_value.copyWith(
      login: freezed == login
          ? _value.login
          : login // ignore: cast_nullable_to_non_nullable
              as UserResponse?,
      register: freezed == register
          ? _value.register
          : register // ignore: cast_nullable_to_non_nullable
              as UserResponse?,
      getProfile: freezed == getProfile
          ? _value.getProfile
          : getProfile // ignore: cast_nullable_to_non_nullable
              as UserData?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserResponseCopyWith<$Res>? get login {
    if (_value.login == null) {
      return null;
    }

    return $UserResponseCopyWith<$Res>(_value.login!, (value) {
      return _then(_value.copyWith(login: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserResponseCopyWith<$Res>? get register {
    if (_value.register == null) {
      return null;
    }

    return $UserResponseCopyWith<$Res>(_value.register!, (value) {
      return _then(_value.copyWith(register: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserDataCopyWith<$Res>? get getProfile {
    if (_value.getProfile == null) {
      return null;
    }

    return $UserDataCopyWith<$Res>(_value.getProfile!, (value) {
      return _then(_value.copyWith(getProfile: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserResponseModelImplCopyWith<$Res>
    implements $UserResponseModelCopyWith<$Res> {
  factory _$$UserResponseModelImplCopyWith(_$UserResponseModelImpl value,
          $Res Function(_$UserResponseModelImpl) then) =
      __$$UserResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {UserResponse? login, UserResponse? register, UserData? getProfile});

  @override
  $UserResponseCopyWith<$Res>? get login;
  @override
  $UserResponseCopyWith<$Res>? get register;
  @override
  $UserDataCopyWith<$Res>? get getProfile;
}

/// @nodoc
class __$$UserResponseModelImplCopyWithImpl<$Res>
    extends _$UserResponseModelCopyWithImpl<$Res, _$UserResponseModelImpl>
    implements _$$UserResponseModelImplCopyWith<$Res> {
  __$$UserResponseModelImplCopyWithImpl(_$UserResponseModelImpl _value,
      $Res Function(_$UserResponseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? login = freezed,
    Object? register = freezed,
    Object? getProfile = freezed,
  }) {
    return _then(_$UserResponseModelImpl(
      login: freezed == login
          ? _value.login
          : login // ignore: cast_nullable_to_non_nullable
              as UserResponse?,
      register: freezed == register
          ? _value.register
          : register // ignore: cast_nullable_to_non_nullable
              as UserResponse?,
      getProfile: freezed == getProfile
          ? _value.getProfile
          : getProfile // ignore: cast_nullable_to_non_nullable
              as UserData?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserResponseModelImpl implements _UserResponseModel {
  const _$UserResponseModelImpl({this.login, this.register, this.getProfile});

  factory _$UserResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserResponseModelImplFromJson(json);

  @override
  final UserResponse? login;
  @override
  final UserResponse? register;
  @override
  final UserData? getProfile;

  @override
  String toString() {
    return 'UserResponseModel(login: $login, register: $register, getProfile: $getProfile)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserResponseModelImpl &&
            (identical(other.login, login) || other.login == login) &&
            (identical(other.register, register) ||
                other.register == register) &&
            (identical(other.getProfile, getProfile) ||
                other.getProfile == getProfile));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, login, register, getProfile);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserResponseModelImplCopyWith<_$UserResponseModelImpl> get copyWith =>
      __$$UserResponseModelImplCopyWithImpl<_$UserResponseModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserResponseModelImplToJson(
      this,
    );
  }
}

abstract class _UserResponseModel implements UserResponseModel {
  const factory _UserResponseModel(
      {final UserResponse? login,
      final UserResponse? register,
      final UserData? getProfile}) = _$UserResponseModelImpl;

  factory _UserResponseModel.fromJson(Map<String, dynamic> json) =
      _$UserResponseModelImpl.fromJson;

  @override
  UserResponse? get login;
  @override
  UserResponse? get register;
  @override
  UserData? get getProfile;
  @override
  @JsonKey(ignore: true)
  _$$UserResponseModelImplCopyWith<_$UserResponseModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
