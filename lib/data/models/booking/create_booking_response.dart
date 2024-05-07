import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_booking_response.freezed.dart';
part 'create_booking_response.g.dart';

@freezed
class CreateBookingResponse with _$CreateBookingResponse {
  const factory CreateBookingResponse({
    required int? id,
    required int? userId,
    required int? facilityId,
    required String? status,
    required int? price,
  }) = _CreateBookingResponse;

  factory CreateBookingResponse.fromJson(Map<String, dynamic> json) => _$CreateBookingResponseFromJson(json);
}
