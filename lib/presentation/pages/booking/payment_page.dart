import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sport_app/core/router/routes.dart';
import 'package:sport_app/presentation/pages/booking/cubit/booking_cubit.dart';
import 'package:sport_app/presentation/widgets/custom_error_widget.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:sport_app/presentation/widgets/scaffold_with_app_bar.dart';

import 'dart:async';
import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sport_app/core/router/routes.dart';
import 'package:sport_app/presentation/pages/booking/cubit/booking_cubit.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:sport_app/presentation/widgets/scaffold_with_app_bar.dart';

class PaymentPage extends StatefulWidget {
  final double price;
  final String desc;
  final int facilityId;
  final List<int> cells;

  const PaymentPage({
    Key? key,
    required this.price,
    required this.desc,
    required this.cells,
    required this.facilityId,
  }) : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  late BookingCubit bookingCubit;

  @override
  void initState() {
    bookingCubit = BookingCubit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String publicKey = 'sandbox_i69297607762';
    String privateKey = 'sandbox_1iShFxZY7Xsp9Ab6lGojbEs4mNGy6ngW9BqGBRuv';
    String orderId = '76';
    double amount = widget.price;
    String currency = 'UAH';
    String description = widget.desc;
    String language = 'UK';
    String data = _generateData(publicKey, orderId, amount, currency, description, language);
    String signature = _generateSignature(privateKey, data);

    late WebViewController _webViewController;
    String successUrl = 'https://www.liqpay.ua/uk/promo';
    String url = 'https://www.liqpay.ua/api/3/checkout?data=$data&signature=$signature';

    return BlocProvider.value(
      value: bookingCubit,
      child: BlocBuilder<BookingCubit, BookingState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const CircularProgressIndicator();
          } else if (state.errorMessage != null) {
            return CustomErrorWidget(errorMessage: state.errorMessage!);
          }
          _webViewController = WebViewController()
            ..setJavaScriptMode(JavaScriptMode.unrestricted)
            ..setBackgroundColor(const Color(0x00000000))
            ..setNavigationDelegate(
              NavigationDelegate(
                onNavigationRequest: (NavigationRequest request) {
                  if (request.url.contains(successUrl)) {
                    Future.delayed(const Duration(seconds: 5))
                        .then((value) => context.read<BookingCubit>().createBooking(
                              facilityId: widget.facilityId,
                              timeSlots: widget.cells,
                            ))
                        .then((value) => context.go(AppRoutes.reservation));
                    return NavigationDecision.prevent;
                  }
                  return NavigationDecision.navigate;
                },
              ),
            )
            ..loadRequest(Uri.parse(url));

          return ScaffoldWithAppBar(
            appBarTitle: "Choose payment",
            centerTitle: true,
            child: WebViewWidget(
              controller: _webViewController,
            ),
          );
        },
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
