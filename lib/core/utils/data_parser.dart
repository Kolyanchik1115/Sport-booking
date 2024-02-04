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
}
