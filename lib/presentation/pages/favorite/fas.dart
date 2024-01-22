import 'package:flutter/material.dart';
import 'package:sport_app/presentation/widgets/empty_layout.dart';

class CustomWidget extends StatefulWidget {
  const CustomWidget({Key? key}) : super(key: key);

  @override
  CustomWidgetState createState() => CustomWidgetState();
}

class CustomWidgetState extends State<CustomWidget> {
  final double itemExtend = 50.0;
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
    return EmptyLayout(
      child: Column(
        children: [
          SizedBox(
            height: itemExtend,
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
                      width: itemExtend,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: isActiveDay[index]
                            ? selectedDay == daysOfWeek[index]
                                ? Theme.of(context).colorScheme.onPrimaryContainer
                                : Theme.of(context).colorScheme.onPrimaryContainer.withOpacity(0.5)
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
                int? price = getPriceForTimeRange(startTime, endTime);
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
                            ? Theme.of(context).colorScheme.onPrimaryContainer.withOpacity(0.5)
                            : Colors.transparent,
                        border: const Border(
                          top: BorderSide(color: Colors.black, width: 0.5),
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
        ],
      ),
    );
  }

  int? getPriceForTimeRange(DateTime startTime, DateTime endTime) {
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
