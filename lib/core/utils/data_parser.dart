import 'package:flutter/material.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';

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

  static String generatePaymentData(
      String publicKey, String orderId, double amount, String currency, String description, String language) {
    Map<String, dynamic> requestData = {
      'public_key': publicKey,
      'version': 3,
      'action': 'pay',
      'amount': amount,
      'currency': currency,
      'description': description,
      'order_id': orderId,
      'language': language,
    };
    String jsonData = json.encode(requestData);
    String base64Data = base64Encode(utf8.encode(jsonData));
    return base64Data;
  }

  static String generatePaymentSignature(String privateKey, String data) {
    String signString = '$privateKey$data$privateKey';
    List<int> bytes = utf8.encode(signString);
    Digest sha1Hash = sha1.convert(bytes);
    String base64Signature = base64Encode(sha1Hash.bytes);
    return base64Signature;
  }
}
