// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'facility_district.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FacilityDistrictImpl _$$FacilityDistrictImplFromJson(
        Map<String, dynamic> json) =>
    _$FacilityDistrictImpl(
      city: json['city'] == null
          ? null
          : FacilityCity.fromJson(json['city'] as Map<String, dynamic>),
      id: json['id'] as int,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$$FacilityDistrictImplToJson(
        _$FacilityDistrictImpl instance) =>
    <String, dynamic>{
      'city': instance.city,
      'id': instance.id,
      'name': instance.name,
    };
