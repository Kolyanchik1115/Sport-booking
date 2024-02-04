part of 'booking_cubit.dart';

@freezed
class BookingState with _$BookingState {
  const factory BookingState({
    @Default(0.0) price,
    @Default([]) List<BookingTimeSlotsModel> timeSlots,
    @Default(false) bool isLoading,
    String? errorMessage,
  }) = _BookingState;
}
