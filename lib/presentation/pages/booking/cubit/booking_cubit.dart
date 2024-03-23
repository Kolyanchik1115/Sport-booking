import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sport_app/data/models/booking/booking_time_slots_model.dart';
import 'package:sport_app/domain/usecases/booking/create_booking.dart';
import 'package:sport_app/domain/usecases/booking/get_all_bookings.dart';
import 'package:sport_app/injector.dart';

part 'booking_state.dart';

part 'booking_cubit.freezed.dart';

class BookingCubit extends Cubit<BookingState> {
  BookingCubit() : super(const BookingState());


  Future<void> getAllBookings({required int id}) async {
    emit(state.copyWith(isLoading: true));

    final data = await injector<GetAllBookingsUseCase>()(GetAllBookingsParams(id: id));

    data.fold(
          (error) => emit(state.copyWith(errorMessage: error.runtimeType.toString(), isLoading: false)),
          (booking) => emit(state.copyWith(timeSlots: booking.facility?.timeSlots ?? [])),
    );
    emit(state.copyWith(isLoading: false));
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

  void updateState({List<int>? cells, DateTime? dateTime, double? price, List<DateTime>? dates}) {
    emit(
      state.copyWith(cells: cells ?? [], dateTime: dateTime, price: price, dates: dates ?? []),
    );
  }


}
