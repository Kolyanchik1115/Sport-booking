// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BookingModelImpl _$$BookingModelImplFromJson(Map<String, dynamic> json) =>
    _$BookingModelImpl(
      id: json['id'] as int,
      status: json['status'] as String,
      startTime: DateTime.parse(json['startTime'] as String),
      facility: BookingsFacilityResponse.fromJson(
          json['facility'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$BookingModelImplToJson(_$BookingModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'startTime': instance.startTime.toIso8601String(),
      'facility': instance.facility,
      'createdAt': instance.createdAt.toIso8601String(),
    };
