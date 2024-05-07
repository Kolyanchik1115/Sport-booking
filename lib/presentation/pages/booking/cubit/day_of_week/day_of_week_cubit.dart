import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sport_app/data/models/booking/booking_time_slots_model.dart';
import 'package:sport_app/domain/usecases/booking/get_all_bookings.dart';
import 'package:sport_app/injector.dart';

part 'day_of_week_state.dart';

part 'day_of_week_cubit.freezed.dart';

class DayOfWeekCubit extends Cubit<DayOfWeekState> {
  DayOfWeekCubit() : super(const DayOfWeekState.initial());

  Future<void> fetchData(int id) async {
    if (state is _Loading) return;

    final data = await injector<GetAllBookingsUseCase>()(GetAllBookingsParams(id: id));

    data.fold(
          (error) => emit(_Error(error.runtimeType.toString())),
          (booking) {
        final facility = booking.facility!;
        if (facility.timeSlots.isEmpty) {
          emit(const _Empty());
        } else {
          final scheduleData =
          List.generate(7, (day) => facility.timeSlots.where((data) => data.dayOfWeek == day + 1).toList());
          //TODO check null state
          emit(_Data(scheduleData: scheduleData));
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
