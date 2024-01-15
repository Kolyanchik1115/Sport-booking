// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'facility_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FacilityResponseImpl _$$FacilityResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$FacilityResponseImpl(
      facilities: (json['facilities'] as List<dynamic>)
          .map((e) => FacilityData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$FacilityResponseImplToJson(
        _$FacilityResponseImpl instance) =>
    <String, dynamic>{
      'facilities': instance.facilities,
    };
