part of 'day_of_week_cubit.dart';

@freezed
class DayOfWeekState with _$DayOfWeekState {
  const factory DayOfWeekState.empty() = _Empty;

  const factory DayOfWeekState.initial() = _Initial;

  const factory DayOfWeekState.loading() = _Loading;

  const factory DayOfWeekState.data(
      {required List<List<BookingTimeSlotsModel>> scheduleData, @Default(0) int selectedDay}) = _Data;

  const factory DayOfWeekState.error(String errorMessage) = _Error;
}
