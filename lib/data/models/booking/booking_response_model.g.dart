// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BookingResponseModelImpl _$$BookingResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$BookingResponseModelImpl(
      facility: json['facility'] == null
          ? null
          : BookingResponse.fromJson(json['facility'] as Map<String, dynamic>),
      createBooking: json['createBooking'] == null
          ? null
          : CreateBookingResponse.fromJson(
              json['createBooking'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$BookingResponseModelImplToJson(
        _$BookingResponseModelImpl instance) =>
    <String, dynamic>{
      'facility': instance.facility,
      'createBooking': instance.createBooking,
    };
