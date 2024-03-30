import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sport_app/data/models/booking/booking_time_slots_model.dart';
import 'package:sport_app/domain/usecases/booking/create_booking.dart';
import 'package:sport_app/domain/usecases/booking/get_all_bookings.dart';
import 'package:sport_app/injector.dart';

part 'booking_cubit.freezed.dart';

part 'booking_state.dart';

class BookingCubit extends Cubit<BookingState> {
  BookingCubit() : super(const BookingState());


  void getBooking(List<BookingTimeSlotsModel> daySlots){
    emit(state.copyWith(timeSlots: daySlots));
  }

  Future<void> createBooking({required int facilityId, required List<int> timeSlots}) async {
    emit(state.copyWith(isLoading: true));

    final data = await injector<CreateBookingUseCase>()(CreateBookingParams(
      facilityId: facilityId,
      timeSlots: timeSlots,
    ));

    data.fold(
      (error) => emit(state.copyWith(errorMessage: error.runtimeType.toString(), isLoading: false)),
      (booking) => emit(state.copyWith(errorMessage: '', isLoading: false)),
    );
    emit(state.copyWith(isLoading: false));
  }

  void updateState(
      {required List<int> cells, required DateTime dateTime, required double price, required List<DateTime> dates}) {
    emit(
      state.copyWith(cells: cells, dateTime: dateTime, totalPrice: price, dates: dates),
    );
  }

  void resetRange() {
    emit(state.copyWith(selectedIdRange: [], totalPrice: 0.0));
  }

  void updateRange(int id) {
    final List<int> range = List.of(state.selectedIdRange);
    if (range.isEmpty) {
      range.add(id);
    }
    if (range.contains(id) || (id > range.first && id < range.last)) {
      range.clear();
    }

    range.add(id);
    range.sort((a, b) => a.compareTo(b));
    _fullSelectedRange(range);
    _calculatePrice();
  }

  void _fullSelectedRange(List<int> range) {
    final List<int> newRangeList = [];
    final newRange = state.timeSlots.where((slot) => slot.id >= range.first && slot.id <= range.last).toList();
    for (BookingTimeSlotsModel i in newRange.toList()) {
      newRangeList.add(i.id);
    }
    emit(state.copyWith(selectedIdRange: newRangeList));
  }

  void _calculatePrice() {
    double price = 0.0;
    final selectedIdRange = state.selectedIdRange;
    for (int i = selectedIdRange.first; i <= selectedIdRange.last; i++) {
      final index = state.timeSlots.indexWhere((slot) => slot.id == i);
      price += state.timeSlots[index].price.toDouble();
    }
    emit(state.copyWith(totalPrice: price));
  }
}
