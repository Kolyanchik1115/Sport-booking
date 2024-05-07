import 'package:flutter/material.dart';

class DateParser {
  static Future<DateTime?> showDataPicker(BuildContext context) {
    return showDatePicker(
      context: context,
      initialDate: DateTime.now().subtract(const Duration(days: 4745)),
      firstDate: DateTime(1900),
      lastDate: DateTime.now().subtract(const Duration(days: 4745)),
      errorInvalidText: 'You cannot register if you under 13',
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Theme.of(context).colorScheme.primary,
              background: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          child: child!,
        );
      },
    );
  }

  static String formatServerTime(String serverTime) {
    final date = DateTime.parse(serverTime).toLocal();
    final formattedDate =
        '${date.year}.${date.month.toString().padLeft(2, '0')}.${date.day.toString().padLeft(2, '0')}';
    return formattedDate;
  }

  // static double? getCurrentSelectedPrice(
  //   List<List<bool>> isOrange,
  //   List<List<BookingTimeSlotsModel>> scheduleData,
  //   List<String> daysOfWeek,
  //   List<bool> isActiveDay,
  //   DateTime selectedDate,
  // ) {
  //   double totalPrice = 0;
  //
  //   for (int dayIndex = 0; dayIndex < 7; dayIndex++) {
  //     for (int index = 0; index < isOrange[dayIndex].length; index++) {
  //       if (isOrange[dayIndex][index]) {
  //         DateTime startTime;
  //         DateTime endTime;
  //
  //         if (index < scheduleData[dayIndex].length) {
  //           startTime = scheduleData[dayIndex][index].startTime.toUtc();
  //           endTime = startTime.add(const Duration(minutes: 30));
  //         } else {
  //           startTime = DateTime(1970, 1, 1, 0, 0).toUtc();
  //           endTime = DateTime(1970, 1, 1, 0, 0).toUtc();
  //         }
  //
  //         int? price = getPriceForTimeRange(startTime.toUtc().toIso8601String(), endTime.toUtc().toIso8601String(),
  //             daysOfWeek[dayIndex], scheduleData, daysOfWeek);
  //
  //         if (price != null) {
  //           totalPrice += price;
  //         }
  //       }
  //     }
  //   }
  //   for (int i = 0; i < isActiveDay.length; i++) {
  //     if (isActiveDay[i]) {
  //       selectedDate = selectedDate.add(Duration(days: i));
  //       break;
  //     }
  //   }
  //   return totalPrice != 0 ? totalPrice : null;
  // }

  // static int? getPriceForTimeRange(String startTimeString, String endTimeString, String selectedDay,
  //     List<List<BookingTimeSlotsModel>> scheduleData, List<String> daysOfWeek) {
  //   int totalPrice = 0;
  //   for (var interval in scheduleData[daysOfWeek.indexOf(selectedDay)]) {
  //     if (DateTime.parse(startTimeString).toUtc().isBefore(DateTime.parse('${interval.endTime}').toUtc()) &&
  //         DateTime.parse(endTimeString).toUtc().isAfter(DateTime.parse('${interval.startTime}').toUtc())) {
  //       double partialPrice =
  //           DateTime.parse(endTimeString).toUtc().difference(DateTime.parse(startTimeString).toUtc()).inMinutes /
  //               30 *
  //               interval.price;
  //       totalPrice += partialPrice.round();
  //     }
  //   }
  //   return totalPrice != 0 ? totalPrice : null;
  // }
}
