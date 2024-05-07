part of 'booking_cubit.dart';

@freezed
class BookingState with _$BookingState {
  const factory BookingState({
    @Default(0.0) double totalPrice,
     DateTime? dateTime,
    @Default([]) List<DateTime> dates,
    @Default([]) List<int> cells,
    @Default([]) List<BookingTimeSlotsModel> timeSlots,
    @Default(false) bool isLoading,
    @Default([]) List<int> selectedIdRange,
    String? errorMessage,
  }) = _BookingState;
}
