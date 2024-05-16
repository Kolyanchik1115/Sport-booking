// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookings_facility_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BookingsFacilityResponseImpl _$$BookingsFacilityResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$BookingsFacilityResponseImpl(
      id: json['id'] as int,
      name: json['name'] as String,
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$BookingsFacilityResponseImplToJson(
        _$BookingsFacilityResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'images': instance.images,
    };
