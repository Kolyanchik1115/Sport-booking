// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookings_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BookingsResponseModelImpl _$$BookingsResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$BookingsResponseModelImpl(
      bookings: (json['bookings'] as List<dynamic>)
          .map((e) => BookingModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$BookingsResponseModelImplToJson(
        _$BookingsResponseModelImpl instance) =>
    <String, dynamic>{
      'bookings': instance.bookings,
    };
