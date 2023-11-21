// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserDataImpl _$$UserDataImplFromJson(Map<String, dynamic> json) =>
    _$UserDataImpl(
      id: json['id'] as int?,
      email: json['email'] as String?,
      fullname: json['fullname'] as String?,
      isActivated: json['isActivated'] as bool?,
      avatar: json['avatar'] as String?,
      dateOfBirth: json['dateOfBirth'] == null
          ? null
          : DateTime.parse(json['dateOfBirth'] as String),
    );

Map<String, dynamic> _$$UserDataImplToJson(_$UserDataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'fullname': instance.fullname,
      'isActivated': instance.isActivated,
      'avatar': instance.avatar,
      'dateOfBirth': instance.dateOfBirth?.toIso8601String(),
    };
