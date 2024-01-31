import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sport_app/core/utils/dummy_data.dart';
import 'package:sport_app/data/models/booking/booking_time_slots_model.dart';
import 'package:sport_app/presentation/pages/booking/cubit/booking_cubit.dart';
import 'package:sport_app/presentation/widgets/app_elevated_button.dart';
import 'package:sport_app/presentation/widgets/empty_layout.dart';

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
  int? selectedTimeSlotIndex;

  List<Set<int>> selectedCellIds = List.generate(7, (day) => {});
  List<List<BookingTimeSlotsModel>> scheduleData = List.generate(7, (day) => []);
  List<List<bool>> isOrange = List.generate(7, (day) => List.filled(48, false));
  List<bool> isActiveDay = [];

  Future<void> fetchData() async {
    await widget.bookingCubit.getAllBookings(id: widget.facilityId);
    scheduleData = List.generate(
        7, (day) => widget.bookingCubit.state.timeSlots.where((data) => data.dayOfWeek == day + 1).toList());
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int? currentPrice = getCurrentSelectedPrice();

    return BlocProvider.value(
      value: widget.bookingCubit,
      child: BlocBuilder<BookingCubit, BookingState>(
        builder: (context, state) {
          isActiveDay = List.generate(daysOfWeek.length, (index) => scheduleData[index].isNotEmpty);
          return EmptyLayout(
            child: Column(
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
                            if (isActiveDay[index]) {
                              setState(() {
                                selectedDay = daysOfWeek[index];
                                for (int i = 0; i < daysOfWeek.length; i++) {
                                  isOrange[i] = List.filled(48, false);
                                }
                                isOrange[daysOfWeek.indexOf(selectedDay)] = List.filled(48, false);
                              });
                            }
                          },
                          child: Container(
                            width: itemExtend + 5,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: isActiveDay[index]
                                  ? selectedDay == daysOfWeek[index]
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
                Expanded(
                  child: ListView.builder(
                    itemCount: scheduleData[daysOfWeek.indexOf(selectedDay)].length + 1,
                    padding: const EdgeInsets.only(top: 25.0),
                    itemExtent: itemExtend,
                    itemBuilder: (context, index) {
                      if (index < scheduleData[daysOfWeek.indexOf(selectedDay)].length) {
                        int? price = getPriceForTimeRange(
                          scheduleData[daysOfWeek.indexOf(selectedDay)][index].startTime.toIso8601String(),
                          scheduleData[daysOfWeek.indexOf(selectedDay)][index].endTime.toIso8601String(),
                          selectedDay,
                        );
                        return ListTile(
                          contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
                          leading: SizedBox(
                            width: itemExtend + 5,
                            child: Transform.translate(
                              offset: Offset(0, -itemExtend / 2),
                              child: Text(
                                '${scheduleData[daysOfWeek.indexOf(selectedDay)][index].startTime.hour.toString().padLeft(2, '0')}:${scheduleData[daysOfWeek.indexOf(selectedDay)][index].startTime.minute.toString().padLeft(2, '0')}',
                                style: const TextStyle(fontSize: 16.0, color: Colors.black),
                              ),
                            ),
                          ),
                          subtitle: InkWell(
                            onTap: () {
                              if (isActiveDay[daysOfWeek.indexOf(selectedDay)]) {
                                setState(() {
                                  isOrange[daysOfWeek.indexOf(selectedDay)][index] =
                                      !isOrange[daysOfWeek.indexOf(selectedDay)][index];

                                  int cellId = scheduleData[daysOfWeek.indexOf(selectedDay)][index].id;

                                  if (price != null) {
                                    if (isOrange[daysOfWeek.indexOf(selectedDay)][index]) {
                                      selectedCellIds[daysOfWeek.indexOf(selectedDay)].add(cellId);
                                    } else {
                                      selectedCellIds[daysOfWeek.indexOf(selectedDay)].remove(cellId);
                                    }
                                  }

                                  List<int> activeCellIds = selectedCellIds[daysOfWeek.indexOf(selectedDay)].toList();
                                  print('Active Cell IDs: $activeCellIds');

                                  DateTime selectedStartTime =
                                      scheduleData[daysOfWeek.indexOf(selectedDay)][index].startTime.toUtc();
                                  DateTime selectedEndTime = selectedStartTime.add(const Duration(minutes: 30)).toUtc();
                                  print('Selected Range: $selectedStartTime to $selectedEndTime');
                                });
                              }
                            },
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                color: price != null &&
                                        isOrange[daysOfWeek.indexOf(selectedDay)][index] &&
                                        isActiveDay[daysOfWeek.indexOf(selectedDay)]
                                    ? Theme.of(context).colorScheme.primary.withOpacity(0.5)
                                    : Colors.transparent,
                                border: Border(
                                  left: BorderSide(
                                      color: price != null ? Theme.of(context).colorScheme.primary : Colors.transparent,
                                      width: 4.0),
                                  top: const BorderSide(color: Colors.black, width: 0.2),
                                ),
                              ),
                              child: Center(
                                child: price != null
                                    ? Text(
                                        '$price₴',
                                        style: const TextStyle(color: Colors.black),
                                      )
                                    : const SizedBox.shrink(),
                              ),
                            ),
                          ),
                        );
                      } else {
                        DateTime lastCellEndTime = scheduleData[daysOfWeek.indexOf(selectedDay)].isNotEmpty
                            ? scheduleData[daysOfWeek.indexOf(selectedDay)].last.endTime
                            : DateTime.now();
                        return ListTile(
                          contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
                          leading: SizedBox(
                            width: itemExtend + 5,
                            child: Transform.translate(
                              offset: Offset(0, -itemExtend / 2),
                              child: Text(
                                '${lastCellEndTime.hour.toString().padLeft(2, '0')}:${lastCellEndTime.minute.toString().padLeft(2, '0')}',
                                style: const TextStyle(fontSize: 16.0, color: Colors.black),
                              ),
                            ),
                          ),
                          subtitle: InkWell(
                            onTap: () {},
                            child: const DecoratedBox(
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                border: Border(
                                  left: BorderSide(
                                    color: Colors.transparent,
                                    width: 4.0,
                                  ),
                                  top: BorderSide(color: Colors.black, width: 0.2),
                                ),
                              ),
                              child: Center(
                                child: SizedBox.shrink(),
                              ),
                            ),
                          ),
                        );
                      }
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(6.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 25.0),
                            child: Text(
                              'Total:  ',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(color: Theme.of(context).colorScheme.secondary),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              currentPrice != null ? '$currentPrice₴' : '0.0₴',
                              style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 50.0),
                        child: SizedBox(
                          child: AppElevatedButton(
                            text: 'Submit',
                            textStyle: currentPrice != null
                                ? Theme.of(context).textTheme.titleLarge?.copyWith(
                                      color: Theme.of(context).colorScheme.background,
                                    )
                                : Theme.of(context).textTheme.titleLarge?.copyWith(
                                      color: Theme.of(context).colorScheme.onPrimary,
                                    ),
                            onPressed: () {
                              if (currentPrice != null && selectedCellIds.isNotEmpty) {
                                widget.bookingCubit.currentPrice = currentPrice;

                                int selectedDayIndex = daysOfWeek.indexOf(selectedDay);

                                int firstSelectedIndex = selectedCellIds[selectedDayIndex].reduce((min, id) => id < min ? id : min);
                                int lastSelectedIndex = selectedCellIds[selectedDayIndex].reduce((max, id) => id > max ? id : max);

                                DateTime firstSelectedTime = scheduleData[selectedDayIndex].firstWhere((slot) => slot.id == firstSelectedIndex).startTime;
                                DateTime lastSelectedTime = scheduleData[selectedDayIndex].firstWhere((slot) => slot.id == lastSelectedIndex).endTime;

                                print('First Selected Time: $firstSelectedTime');
                                print('Last Selected Time: $lastSelectedTime');

                                context.pop([selectedCellIds, currentPrice, firstSelectedTime, lastSelectedTime]);
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  int? getCurrentSelectedPrice() {
    int totalPrice = 0;

    for (int dayIndex = 0; dayIndex < 7; dayIndex++) {
      for (int index = 0; index < isOrange[dayIndex].length; index++) {
        if (isOrange[dayIndex][index]) {
          DateTime startTime;
          DateTime endTime;

          if (index < scheduleData[dayIndex].length) {
            startTime = scheduleData[dayIndex][index].startTime.toUtc();
            endTime = startTime.add(const Duration(minutes: 30));
          } else {
            startTime = DateTime(1970, 1, 1, 0, 0).toUtc();
            endTime = DateTime(1970, 1, 1, 0, 0).toUtc();
          }

          int? price = getPriceForTimeRange(
            startTime.toUtc().toIso8601String(),
            endTime.toUtc().toIso8601String(),
            daysOfWeek[dayIndex],
          );

          if (price != null) {
            totalPrice += price;
          }
        }
      }
    }

    return totalPrice != 0 ? totalPrice : null;
  }

  int? getPriceForTimeRange(String startTimeString, String endTimeString, String selectedDay) {
    int totalPrice = 0;

    for (var interval in scheduleData[daysOfWeek.indexOf(selectedDay)]) {
      DateTime intervalStartTime = DateTime.parse('${interval.startTime}').toUtc();
      DateTime intervalEndTime = DateTime.parse('${interval.endTime}').toUtc();
      DateTime startTime = DateTime.parse(startTimeString).toUtc();
      DateTime endTime = DateTime.parse(endTimeString).toUtc();

      // print('Interval: $intervalStartTime to $intervalEndTime');
      // print('Selected Range: $startTime to $endTime');

      if (startTime.isBefore(intervalEndTime) && endTime.isAfter(intervalStartTime)) {
        double partialPrice = endTime.difference(startTime).inMinutes / 30 * interval.price;
        totalPrice += partialPrice.round();
      }
    }
    // print('Total Price: $totalPrice');

    return totalPrice != 0 ? totalPrice : null;
  }
}
