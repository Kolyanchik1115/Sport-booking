import 'package:freezed_annotation/freezed_annotation.dart';

import 'bookings_facility_response.dart';

part 'booking_model.freezed.dart';
part 'booking_model.g.dart';

@freezed
class BookingModel with _$BookingModel {
  const factory BookingModel({
    required int id,
    required String status,
    required DateTime startTime,
    required BookingsFacilityResponse facility,
    required DateTime createdAt,
  }) = _BookingModel;

  factory BookingModel.fromJson(Map<String, dynamic> json) => _$BookingModelFromJson(json);

}
