import 'package:freezed_annotation/freezed_annotation.dart';

part 'booking_time_slots_model.freezed.dart';
part 'booking_time_slots_model.g.dart';

@freezed
class BookingTimeSlotsModel with _$BookingTimeSlotsModel {
  const factory BookingTimeSlotsModel({
    required int id,
    required int dayOfWeek,
    required DateTime startTime,
    required DateTime endTime,
    required double price,
    required String status,
  }) = _BookingTimeSlotsModel;

  factory BookingTimeSlotsModel.fromJson(Map<String, dynamic> json) => _$BookingTimeSlotsModelFromJson(json);
}
