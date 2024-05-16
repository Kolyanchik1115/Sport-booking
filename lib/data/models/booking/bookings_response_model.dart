import 'package:freezed_annotation/freezed_annotation.dart';

import 'booking_model.dart';

part 'bookings_response_model.freezed.dart';
part 'bookings_response_model.g.dart';

@freezed
class BookingsResponseModel with _$BookingsResponseModel {
  const factory BookingsResponseModel({
    required List<BookingModel> bookings,
  }) = _BookingsResponseModel;

  factory BookingsResponseModel.fromJson(Map<String, dynamic> json) => _$BookingsResponseModelFromJson(json);
}
