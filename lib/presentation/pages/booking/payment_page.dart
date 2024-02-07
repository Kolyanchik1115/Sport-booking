import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:sport_app/presentation/widgets/scaffold_with_app_bar.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    String publicKey = 'sandbox_i96049219746';
    String privateKey = 'sandbox_F6VrfCGLdoGUWUb7BoMPT29jxpupo6r0Eb24UHfY';
    String orderId = '000001';
    double amount = 1.0;
    String currency = 'UAH';
    String description = 'Описание платежа';
    String language = 'UK';
    String data = _generateData(publicKey, orderId, amount, currency, description, language);
    String signature = _generateSignature(privateKey, data);

    WebViewController controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse('https://www.liqpay.ua/api/3/checkout?data=$data&signature=$signature'));

    return ScaffoldWithAppBar(
      appBarTitle: 'Choose payment system',
      child: WebViewWidget(
        controller: controller,
      ),
    );
  }

  String _generateData(
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

  String _generateSignature(String privateKey, String data) {
    String signString = '$privateKey$data$privateKey';
    List<int> bytes = utf8.encode(signString);
    Digest sha1Hash = sha1.convert(bytes);
    String base64Signature = base64Encode(sha1Hash.bytes);
    return base64Signature;
  }
}

// class PaymentForm extends StatefulWidget {
//   @override
//   _PaymentFormState createState() => _PaymentFormState();
// }
//
// class _PaymentFormState extends State<PaymentForm> {
//   final _formKey = GlobalKey<FormState>();
//   TextEditingController cardNumberController = TextEditingController();
//   TextEditingController expiryController = TextEditingController();
//   TextEditingController cvvController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('LiqPay Payment Form'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(20.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               TextFormField(
//                 controller: cardNumberController,
//                 keyboardType: TextInputType.number,
//                 inputFormatters: [LengthLimitingTextInputFormatter(16)],
//                 decoration: InputDecoration(
//                   labelText: 'Номер карты',
//                 ),
//                 validator: (value) {
//                   if (value == null) {
//                     return 'Введите номер карты';
//                   }
//                   return null;
//                 },
//               ),
//               TextFormField(
//                 controller: expiryController,
//                 keyboardType: TextInputType.number,
//                 inputFormatters: [LengthLimitingTextInputFormatter(5), _ExpiryDateFormatter()],
//                 decoration: InputDecoration(
//                   labelText: 'Срок действия (мм/гг)',
//                 ),
//                 validator: (value) {
//                   if (value == null) {
//                     return 'Введите срок действия';
//                   }
//                   return null;
//                 },
//               ),
//               TextFormField(
//                 controller: cvvController,
//                 keyboardType: TextInputType.number,
//                 inputFormatters: [LengthLimitingTextInputFormatter(3)],
//                 decoration: InputDecoration(
//                   labelText: 'CVV',
//                 ),
//                 validator: (value) {
//                   if (value == null) {
//                     return 'Введите CVV';
//                   }
//                   return null;
//                 },
//                 obscureText: true,
//               ),
//               TextFormField(
//                 controller: emailController,
//                 keyboardType: TextInputType.emailAddress,
//                 decoration: InputDecoration(
//                   labelText: 'Email',
//                 ),
//                 validator: (value) {
//                   if (value == null) {
//                     return 'Введите ваш email';
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () {
//                   if (_formKey.currentState!.validate()) {
//                     String expiry = expiryController.text;
//                     List<String> expiryParts = expiry.split('/');
//
//                     _submitPayment(
//                       cardNumber: cardNumberController.text,
//                       expiryMonth: expiryParts[0],
//                       expiryYear: expiryParts[1],
//                       cvv: cvvController.text,
//                       amount: 200,
//                     );
//                   }
//                 },
//                 child: Text('Оплатить'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   static final LiqPay _liqPay = LiqPay("sandbox_i92370631986", "sandbox_IOFZse3PqDrCBzCyR0a2XxhAY8GrIjekxYl8qZA3");
//
//   Future<LiqPayResponse> _submitPayment({
//     required String cardNumber,
//     required String expiryMonth,
//     required String expiryYear,
//     required String cvv,
//     required double amount,
//   }) async {
//     final LiqPayCard card = LiqPayCard(
//       cardNumber,
//       expiryMonth,
//       expiryYear,
//       cvv,
//     );
//     final LiqPayOrder order = LiqPayOrder(
//       DateTime.now().millisecondsSinceEpoch.toString(),
//       amount,
//       'Sport-booking',
//       card: card,
//       action: LiqPayAction.pay,
//       currency: LiqPayCurrency.uah,
//     );
//     return await _liqPay.purchase(order);
//   }
// }
//
// class _ExpiryDateFormatter extends TextInputFormatter {
//   @override
//   TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
//     var text = newValue.text;
//     if (newValue.selection.baseOffset == 2 && !newValue.text.endsWith('/')) {
//       text += '/';
//     }
//     return newValue.copyWith(text: text, selection: TextSelection.collapsed(offset: text.length));
//   }
// }
