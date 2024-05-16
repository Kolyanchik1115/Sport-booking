import 'package:freezed_annotation/freezed_annotation.dart';

import 'booking_time_slots_model.dart';

part 'booking_schedule_model.freezed.dart';
part 'booking_schedule_model.g.dart';

@freezed
class BookingScheduleModel with _$BookingScheduleModel {
  const factory BookingScheduleModel({
    required DateTime date,
    required List<BookingTimeSlotsModel> timeSlots,
  }) = _BookingScheduleModel;

  factory BookingScheduleModel.fromJson(Map<String, dynamic> json) => _$BookingScheduleModelFromJson(json);
}
