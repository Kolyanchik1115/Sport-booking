import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sport_app/data/models/booking/booking_time_slots_model.dart';
import 'package:sport_app/domain/usecases/booking/get_all_bookings.dart';
import 'package:sport_app/injector.dart';

part 'booking_state.dart';

part 'booking_cubit.freezed.dart';

class BookingCubit extends Cubit<BookingState> {
  BookingCubit() : super(const BookingState());

  double? _currentPrice;
  List<int>? _cells;
  List<DateTime>? _dates;

  List<int>? get cells => _cells;

  double? get currentPrice => _currentPrice;

  List<DateTime>? get dates => _dates;

  set cells(List<int>?  value) {
    _cells = value;
    emit(state.copyWith(cells: value!));
  }

  set currentPrice(double? value) {
    _currentPrice = value;
    emit(state.copyWith(price: value));
  }

  set dates(List<DateTime>? value) {
    _dates = value;
    emit(state.copyWith(dates: value!));
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
