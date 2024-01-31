// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BookingResponseModelImpl _$$BookingResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$BookingResponseModelImpl(
      facility:
          BookingResponse.fromJson(json['facility'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$BookingResponseModelImplToJson(
        _$BookingResponseModelImpl instance) =>
    <String, dynamic>{
      'facility': instance.facility,
    };
