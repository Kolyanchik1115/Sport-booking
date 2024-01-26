import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sport_app/presentation/widgets/app_elevated_button.dart';
import 'package:sport_app/presentation/widgets/empty_layout.dart';

class FacilityBookingPage extends StatefulWidget {
  const FacilityBookingPage({super.key});

  @override
  FacilityBookingPageState createState() => FacilityBookingPageState();
}

class FacilityBookingPageState extends State<FacilityBookingPage> {
  final double itemExtend = 45.0;
  List<String> daysOfWeek = ['MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN'];
  String selectedDay = 'MON';

  List<Map<String, dynamic>> scheduleData = [
    {"dayOfWeek": 1, "startTime": "14:00:00.000Z", "endTime": "14:30:00.000Z", "price": 125},
    {"dayOfWeek": 1, "startTime": "14:30:00.000Z", "endTime": "15:00:00.000Z", "price": 250},
    {"dayOfWeek": 2, "startTime": "13:00:00.000Z", "endTime": "13:30:00.000Z", "price": 122},
    {"dayOfWeek": 2, "startTime": "13:30:00.000Z", "endTime": "14:00:00.000Z", "price": 234},
  ];
  List<bool> isOrange = List.filled(23, false);
  List<bool> isActiveDay = [];

  @override
  void initState() {
    super.initState();
    updateActiveDays();
  }

  void updateActiveDays() {
    isActiveDay = List.generate(
      daysOfWeek.length,
          (index) => scheduleData.any((data) => data['dayOfWeek'] == index + 1),
    );
  }

  @override
  Widget build(BuildContext context) {
    int? currentPrice = getCurrentSelectedPrice();

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
              itemCount: 23,
              padding: const EdgeInsets.only(top: 25.0),
              itemExtent: itemExtend,
              itemBuilder: (context, index) {
                DateTime startTime = DateTime(2024, 1, 1, 12, 0).add(Duration(minutes: index * 30));
                DateTime endTime = startTime.add(const Duration(minutes: 30));
                int? price = getPriceForTimeRange(startTime, endTime, selectedDay);

                return ListTile(
                  leading: Transform.translate(
                    offset: Offset(0, -itemExtend / 2),
                    child: Text(
                      '${startTime.hour.toString().padLeft(2, '0')}:${startTime.minute.toString().padLeft(2, '0')}',
                      style: const TextStyle(fontSize: 16.0, color: Colors.black),
                    ),
                  ),
                  subtitle: InkWell(
                    onTap: () {
                      if (isActiveDay[daysOfWeek.indexOf(selectedDay)]) {
                        setState(() {
                          isOrange[index] = !isOrange[index];
                        });
                      }
                    },
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: price != null && isOrange[index] && isActiveDay[daysOfWeek.indexOf(selectedDay)]
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
                      onPressed: () => context.pop(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  int? getCurrentSelectedPrice() {
    int totalPrice = 0;

    for (int index = 0; index < isOrange.length; index++) {
      if (isOrange[index]) {
        DateTime startTime = DateTime(2024, 1, 1, 12, 0).add(Duration(minutes: index * 30));
        DateTime endTime = startTime.add(const Duration(minutes: 30));

        for (int dayIndex = 0; dayIndex < daysOfWeek.length; dayIndex++) {
          int? price = getPriceForTimeRange(startTime, endTime, daysOfWeek[dayIndex]);
          if (price != null) {
            totalPrice += price;
          }
        }
      }
    }

    return totalPrice != 0 ? totalPrice : null;
  }

  int? getPriceForTimeRange(DateTime startTime, DateTime endTime, String selectedDay) {
    int totalPrice = 0;

    for (var interval in scheduleData) {
      DateTime intervalStartTime = DateTime.parse('2024-01-01T${interval['startTime']}');
      DateTime intervalEndTime = DateTime.parse('2024-01-01T${interval['endTime']}');

      if (interval['dayOfWeek'] == daysOfWeek.indexOf(selectedDay) + 1 &&
          startTime.isBefore(intervalEndTime) &&
          endTime.isAfter(intervalStartTime)) {
        double partialPrice = endTime.difference(startTime).inMinutes / 30 * interval['price'] / 2;
        totalPrice += partialPrice.round();
      }
    }

    return totalPrice != 0 ? totalPrice : null;
  }
}
