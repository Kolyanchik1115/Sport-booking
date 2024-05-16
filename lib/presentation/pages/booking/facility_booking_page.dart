import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sport_app/core/utils/dummy_data.dart';
import 'package:sport_app/features/additional_pages/presentation/widgets/empty_layout.dart';
import 'package:sport_app/presentation/pages/booking/cubit/booking/booking_cubit.dart';
import 'package:sport_app/presentation/pages/booking/cubit/day_of_week/day_of_week_cubit.dart';
import 'package:sport_app/presentation/pages/booking/widget/cells_list_view.dart';
import 'package:sport_app/presentation/pages/booking/widget/total_row_widget.dart';

class FacilityBookingPage extends StatefulWidget {
  final int facilityId;
  final BookingCubit bookingCubit;

  const FacilityBookingPage({super.key, required this.facilityId, required this.bookingCubit});

  @override
  FacilityBookingPageState createState() => FacilityBookingPageState();
}

class FacilityBookingPageState extends State<FacilityBookingPage> {
  final double itemExtend = 45.0;
  List<String> daysOfWeek = DummyData.daysOfWeek;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => DayOfWeekCubit()..fetchData(widget.facilityId),
        ),
        BlocProvider.value(value: widget.bookingCubit),
      ],
      child: EmptyLayout(
        child: BlocBuilder<DayOfWeekCubit, DayOfWeekState>(
          builder: (context, weekState) {
            return weekState.maybeWhen(
              loading: () => const Center(child: CircularProgressIndicator()),
              orElse: () => const SizedBox.shrink(),
              data: (scheduleData, selectedDay) => BlocBuilder<BookingCubit, BookingState>(
                builder: (context, state) {
                  final selectedSchedule = scheduleData[selectedDay];
                  context.read<BookingCubit>().getBooking(selectedSchedule.timeSlots);
                  return Column(
                    children: [
                      SizedBox(
                        height: itemExtend + 5,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: daysOfWeek.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0),
                              child: GestureDetector(
                                onTap: index < scheduleData.length && scheduleData[index].timeSlots.isNotEmpty
                                    ? () {
                                        context.read<BookingCubit>().resetRange();
                                        context.read<BookingCubit>().getBooking(scheduleData[index].timeSlots);
                                        context.read<DayOfWeekCubit>().selectDate(index);
                                      }
                                    : null,
                                child: Container(
                                  width: itemExtend + 5,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: index < scheduleData.length && scheduleData[index].timeSlots.isNotEmpty
                                        ? selectedDay == index
                                            ? Theme.of(context).colorScheme.primary
                                            : Theme.of(context).colorScheme.primary.withOpacity(0.5)
                                        : Theme.of(context).colorScheme.background,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Text(daysOfWeek[index]),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      CellsListViewBuilder(
                        itemExtend: itemExtend,
                        scheduleData: scheduleData.map((e) => e.timeSlots).toList(),
                        daysOfWeek: daysOfWeek,
                        selectedDay: selectedDay,
                        selectedIdRange: state.selectedIdRange,
                        onTap: (index) {
                          context.read<BookingCubit>().updateRange(selectedSchedule.timeSlots[index].id);
                        },
                      ),
                      TotalRowWidget(
                        totalPrice: state.totalPrice,
                        selectedIdRange: state.selectedIdRange,
                        onPressed: () {
                          if (state.totalPrice != 0 && state.selectedIdRange.isNotEmpty) {
                            final selectedSlots = selectedSchedule.timeSlots
                                .where((slot) => state.selectedIdRange.contains(slot.id))
                                .toList();
                            final startTime = selectedSlots.first.startTime;
                            final endTime = selectedSlots.last.endTime;

                            print('First Selected Time: $startTime');
                            print('Last Selected Time: $endTime');
                            print('price: ${state.totalPrice}');
                            print('cells: ${state.selectedIdRange}');
                            print('day: ${selectedSchedule.date}');

                            context.read<BookingCubit>().updateState(
                              cells: state.selectedIdRange,
                              price: state.totalPrice,
                              dateTime: selectedSchedule.date,
                              dates: [startTime, endTime],
                            );
                            context.pop();
                          }
                        },
                      ),
                    ],
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
