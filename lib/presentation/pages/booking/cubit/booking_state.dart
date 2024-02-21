part of 'booking_cubit.dart';

@freezed
class BookingState with _$BookingState {
  const factory BookingState({
    @Default(0.0) price,
    @Default(DateTime.now) dateTime,
    @Default([]) List<DateTime> dates,
    @Default([]) List<int> cells,
    @Default([]) List<BookingTimeSlotsModel> timeSlots,
    @Default(false) bool isLoading,
    String? errorMessage,
  }) = _BookingState;
}
