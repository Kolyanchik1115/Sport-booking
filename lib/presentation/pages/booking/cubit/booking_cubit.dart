import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sport_app/data/models/booking/booking_time_slots_model.dart';
import 'package:sport_app/domain/usecases/booking/get_all_bookings.dart';
import 'package:sport_app/injector.dart';

part 'booking_state.dart';

part 'booking_cubit.freezed.dart';

class BookingCubit extends Cubit<BookingState> {
  BookingCubit() : super(const BookingState());

  int? _currentPrice;

  int? get currentPrice => _currentPrice;

  set currentPrice(int? value) {
    _currentPrice = value;
    emit(state.copyWith(price: value));
  }

  Future<void> getAllBookings({required int id}) async {
    emit(state.copyWith(isLoading: true));

    final data = await injector<GetAllBookingsUseCase>()(GetAllBookingsParams(id: id));

    data.fold(
      (error) => emit(state.copyWith(errorMessage: error.runtimeType.toString(), isLoading: false)),
      (booking) => emit(state.copyWith(timeSlots: booking.facility.timeSlots)),
    );
    emit(state.copyWith(isLoading: false));
  }
}
