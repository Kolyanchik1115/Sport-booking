// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_time_slots_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BookingTimeSlotsModelImpl _$$BookingTimeSlotsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$BookingTimeSlotsModelImpl(
      id: json['id'] as int,
      dayOfWeek: json['dayOfWeek'] as int,
      startTime: DateTime.parse(json['startTime'] as String),
      endTime: DateTime.parse(json['endTime'] as String),
      price: (json['price'] as num).toDouble(),
      status: json['status'] as String,
    );

Map<String, dynamic> _$$BookingTimeSlotsModelImplToJson(
        _$BookingTimeSlotsModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'dayOfWeek': instance.dayOfWeek,
      'startTime': instance.startTime.toIso8601String(),
      'endTime': instance.endTime.toIso8601String(),
      'price': instance.price,
      'status': instance.status,
    };
