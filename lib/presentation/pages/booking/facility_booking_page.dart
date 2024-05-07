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
  String selectedDay = DummyData.daysOfWeek.first;

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
                  context.read<BookingCubit>().getBooking(scheduleData[selectedDay]);
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
                                onTap: () {
                                  context.read<BookingCubit>().resetRange();
                                  context.read<BookingCubit>().getBooking(scheduleData[selectedDay]);
                                  context.read<DayOfWeekCubit>().selectDate(index);
                                },
                                child: Container(
                                  width: itemExtend + 5,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: scheduleData[index].isNotEmpty
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
                        scheduleData: scheduleData,
                        daysOfWeek: daysOfWeek,
                        selectedDay: DummyData.daysOfWeek[selectedDay],
                        selectedIdRange: state.selectedIdRange,
                        onTap: (index) {
                          context.read<BookingCubit>().updateRange(scheduleData[selectedDay][index].id);
                        },
                      ),
                      TotalRowWidget(
                        totalPrice: state.totalPrice,
                        selectedIdRange: state.selectedIdRange,
                        onPressed: () {
                          if (state.totalPrice != 0 && state.selectedIdRange.isNotEmpty) {
                            DateTime startTime = scheduleData[selectedDay]
                                .firstWhere((slot) => state.selectedIdRange.contains(slot.id))
                                .startTime;
                            DateTime endTime = scheduleData[selectedDay]
                                .lastWhere((slot) => state.selectedIdRange.contains(slot.id))
                                .endTime;

                            print('First Selected Time: $startTime');
                            print('Last Selected Time: $endTime');
                            print('price: ${state.totalPrice}');
                            print('cells: ${state.selectedIdRange}');

                            context.read<BookingCubit>().updateState(
                              cells: state.selectedIdRange,
                              price: state.totalPrice,
                              dateTime: DateTime.now(),
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
