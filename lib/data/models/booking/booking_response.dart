import 'package:freezed_annotation/freezed_annotation.dart';
import 'booking_time_slots_model.dart';

part 'booking_response.freezed.dart';
part 'booking_response.g.dart';

@freezed
class BookingResponse with _$BookingResponse {
  const factory BookingResponse({
    required List<BookingTimeSlotsModel> timeSlots,
  }) = _BookingResponse;

  factory BookingResponse.fromJson(Map<String, dynamic> json) => _$BookingResponseFromJson(json);
}
