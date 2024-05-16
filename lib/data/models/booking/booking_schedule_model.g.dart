// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_schedule_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BookingScheduleModelImpl _$$BookingScheduleModelImplFromJson(
        Map<String, dynamic> json) =>
    _$BookingScheduleModelImpl(
      date: DateTime.parse(json['date'] as String),
      timeSlots: (json['timeSlots'] as List<dynamic>)
          .map((e) => BookingTimeSlotsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$BookingScheduleModelImplToJson(
        _$BookingScheduleModelImpl instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'timeSlots': instance.timeSlots,
    };
