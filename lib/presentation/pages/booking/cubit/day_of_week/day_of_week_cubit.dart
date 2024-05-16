import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sport_app/data/models/booking/booking_schedule_model.dart';
import 'package:sport_app/domain/usecases/booking/get_all_bookings.dart';
import 'package:sport_app/injector.dart';

part 'day_of_week_state.dart';
part 'day_of_week_cubit.freezed.dart';


class DayOfWeekCubit extends Cubit<DayOfWeekState> {
  DayOfWeekCubit() : super(const DayOfWeekState.initial());

  Future<void> fetchData(int facilityId) async {
    if (state is _Loading) return;

    emit(const DayOfWeekState.loading());

    final data = await injector<GetAllBookingsUseCase>()(GetAllBookingsParams(id: facilityId));

    data.fold(
          (error) => emit(DayOfWeekState.error(error.toString())),
          (booking) {
        final facility = booking.facility!;
        if (facility.schedule.isEmpty) {
          emit(const DayOfWeekState.empty());
        } else {
          emit(DayOfWeekState.data(scheduleData: facility.schedule, selectedDay: 0));
        }
      },
    );
  }

  void selectDate(int index) {
    if (state is _Data) {
      final currentState = state as _Data;
      emit(currentState.copyWith(selectedDay: index));
    }
  }
}
