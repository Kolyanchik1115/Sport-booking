// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserProfileResponseModelImpl _$$UserProfileResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UserProfileResponseModelImpl(
      getProfile: UserData.fromJson(json['getProfile'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$UserProfileResponseModelImplToJson(
        _$UserProfileResponseModelImpl instance) =>
    <String, dynamic>{
      'getProfile': instance.getProfile,
    };
