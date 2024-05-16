import 'package:freezed_annotation/freezed_annotation.dart';

part 'bookings_facility_response.freezed.dart';

part 'bookings_facility_response.g.dart';

@freezed
class BookingsFacilityResponse with _$BookingsFacilityResponse {
  const factory BookingsFacilityResponse({
    required int id,
    required String name,
    required List<String> images,
  }) = _BookingsFacilityResponse;

  factory BookingsFacilityResponse.fromJson(Map<String, dynamic> json) => _$BookingsFacilityResponseFromJson(json);
}
