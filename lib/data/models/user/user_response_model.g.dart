// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserResponseModelImpl _$$UserResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UserResponseModelImpl(
      login: UserResponse.fromJson(json['login'] as Map<String, dynamic>),
      getProfile: json['getProfile'] == null
          ? null
          : UserData.fromJson(json['getProfile'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$UserResponseModelImplToJson(
        _$UserResponseModelImpl instance) =>
    <String, dynamic>{
      'login': instance.login,
      'getProfile': instance.getProfile,
    };
