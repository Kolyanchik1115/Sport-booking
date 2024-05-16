import 'package:freezed_annotation/freezed_annotation.dart';

import 'booking_response.dart';
import 'bookings_response_model.dart';
import 'create_booking_response.dart';

part 'booking_response_model.freezed.dart';

part 'booking_response_model.g.dart';

@freezed
class BookingResponseModel with _$BookingResponseModel {
  const factory BookingResponseModel({
    BookingsResponseModel? findAllBookings,
    BookingResponse? facility,
    CreateBookingResponse? createBooking,
  }) = _BookingResponseModel;

  factory BookingResponseModel.fromJson(Map<String, dynamic> json) => _$BookingResponseModelFromJson(json);
}
