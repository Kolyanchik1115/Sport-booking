import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sport_app/data/models/booking/booking_response.dart';
import 'package:sport_app/data/models/booking/create_booking_response.dart';

part 'booking_response_model.freezed.dart';

part 'booking_response_model.g.dart';

@freezed
class BookingResponseModel with _$BookingResponseModel {
  const factory BookingResponseModel({
    BookingResponse? facility,
    CreateBookingResponse? createBooking,
  }) = _BookingResponseModel;

  factory BookingResponseModel.fromJson(Map<String, dynamic> json) => _$BookingResponseModelFromJson(json);
}

