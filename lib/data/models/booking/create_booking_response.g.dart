// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_booking_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateBookingResponseImpl _$$CreateBookingResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateBookingResponseImpl(
      id: json['id'] as int?,
      userId: json['userId'] as int?,
      facilityId: json['facilityId'] as int?,
      status: json['status'] as String?,
      price: json['price'] as int?,
    );

Map<String, dynamic> _$$CreateBookingResponseImplToJson(
        _$CreateBookingResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'facilityId': instance.facilityId,
      'status': instance.status,
      'price': instance.price,
    };
