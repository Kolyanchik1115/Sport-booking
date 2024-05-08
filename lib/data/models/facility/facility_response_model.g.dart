// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'facility_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FacilityResponseModelImpl _$$FacilityResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$FacilityResponseModelImpl(
      findAll: json['findAll'] == null
          ? null
          : FacilityResponse.fromJson(json['findAll'] as Map<String, dynamic>),
      getUserFavorites: json['getUserFavorites'] == null
          ? null
          : FacilityResponse.fromJson(
              json['getUserFavorites'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$FacilityResponseModelImplToJson(
        _$FacilityResponseModelImpl instance) =>
    <String, dynamic>{
      'findAll': instance.findAll,
      'getUserFavorites': instance.getUserFavorites,
    };
