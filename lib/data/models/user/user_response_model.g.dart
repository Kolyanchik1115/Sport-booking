// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserResponseModelImpl _$$UserResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UserResponseModelImpl(
      login: json['login'] == null
          ? null
          : UserResponse.fromJson(json['login'] as Map<String, dynamic>),
      register: json['register'] == null
          ? null
          : UserResponse.fromJson(json['register'] as Map<String, dynamic>),
      getProfile: json['getProfile'] == null
          ? null
          : UserData.fromJson(json['getProfile'] as Map<String, dynamic>),
      googleAuth: json['googleAuth'] == null
          ? null
          : UserResponse.fromJson(json['googleAuth'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$UserResponseModelImplToJson(
        _$UserResponseModelImpl instance) =>
    <String, dynamic>{
      'login': instance.login,
      'register': instance.register,
      'getProfile': instance.getProfile,
      'googleAuth': instance.googleAuth,
    };
