import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';

import 'package:google_maps_flutter_platform_interface/google_maps_flutter_platform_interface.dart';

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

  static Future<BitmapDescriptor> getMarkerBitmap(int size, double size2, Color color1, Color color2,
      {String? text}) async {
    if (kIsWeb) size = (size / 2).floor();

    final PictureRecorder pictureRecorder = PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);
    final Paint paint3 = Paint()..color = color1;
    final Paint paint2 = Paint()..color = color2;

    double degreesToRads(num deg) {
      return (deg * 3.14) / 180.0;
    }

    var totalRatio = 2.09439666667 * 3;
    var resultRatio = totalRatio * 2;

    canvas.drawCircle(Offset(size / 2, size / 2), size / 2.0, paint3);
    canvas.drawCircle(Offset(size / 2, size / 2), size / 2.8, paint3);
    canvas.drawCircle(Offset(size / 2, size / 2), size / 3.8, paint3);
    canvas.drawArc(const Offset(0, 0) & Size(size2, size2), degreesToRads(90.0), resultRatio, true, paint3);
    canvas.drawCircle(Offset(size / 2, size / 2), size / 3.2, paint2);
    if (text != null) {
      TextPainter painter = TextPainter(textDirection: TextDirection.ltr);
      painter.text = TextSpan(
        text: text,
        style: TextStyle(fontSize: size / 3, color: Colors.black, fontWeight: FontWeight.normal),
      );
      painter.layout();
      painter.paint(
        canvas,
        Offset(size / 2 - painter.width / 2, size / 2 - painter.height / 2),
      );
    }
    final img = await pictureRecorder.endRecording().toImage(size, size);
    final data = await img.toByteData(format: ImageByteFormat.png) as ByteData;
    return BitmapDescriptor.fromBytes(data.buffer.asUint8List());
  }
}
