// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'facility_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FacilityDataImpl _$$FacilityDataImplFromJson(Map<String, dynamic> json) =>
    _$FacilityDataImpl(
      id: json['id'] as int?,
      name: json['name'] as String?,
      address: json['address'] as String?,
      sportType: json['sportType'] as String?,
      coveringType: json['coveringType'] as String?,
      facilityType: json['facilityType'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$FacilityDataImplToJson(_$FacilityDataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'sportType': instance.sportType,
      'coveringType': instance.coveringType,
      'facilityType': instance.facilityType,
      'description': instance.description,
    };
