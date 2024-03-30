import 'dart:async';
import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sport_app/core/router/router_config.dart';
import 'package:sport_app/core/router/routes.dart';
import 'package:sport_app/features/additional_pages/presentation/widgets/custom_error_widget.dart';
import 'package:sport_app/features/additional_pages/presentation/widgets/scaffold_with_app_bar.dart';
import 'package:sport_app/presentation/pages/booking/cubit/booking/booking_cubit.dart';

import 'package:webview_flutter/webview_flutter.dart';

class PaymentPage extends StatelessWidget {
  final BookingCubit bookingCubit;
  final String desc;
  final int facilityId;

  const PaymentPage({
    super.key,
    required this.desc,
    required this.bookingCubit,
    required this.facilityId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bookingCubit,
      child: BlocBuilder<BookingCubit, BookingState>(
        builder: (context, state) {
          String publicKey = 'sandbox_i69297607762';
          String privateKey = 'sandbox_1iShFxZY7Xsp9Ab6lGojbEs4mNGy6ngW9BqGBRuv';
          String orderId = '13453';
          double amount = state.totalPrice;
          String currency = 'UAH';
          String description = desc;
          String language = 'UK';
          String data = _generateData(publicKey, orderId, amount, currency, description, language);
          String signature = _generateSignature(privateKey, data);

          late WebViewController webViewController;
          String successUrl = 'https://www.liqpay.ua/uk/promo';
          String url = 'https://www.liqpay.ua/api/3/checkout?data=$data&signature=$signature';
          if (state.isLoading) {
            return const CircularProgressIndicator();
          } else if (state.errorMessage != null) {
            return CustomErrorWidget(errorMessage: state.errorMessage!);
          }
          webViewController = WebViewController()
            ..setJavaScriptMode(JavaScriptMode.unrestricted)
            ..setBackgroundColor(const Color(0x00000000))
            ..setNavigationDelegate(
              NavigationDelegate(
                onNavigationRequest: (NavigationRequest request) {
                  if (request.url.contains(successUrl)) {
                    Future.delayed(const Duration(seconds: 5))
                        .then((value) => context.read<BookingCubit>().createBooking(
                              facilityId: facilityId,
                              timeSlots: state.cells,
                            ))
                        .then((value) {
                          context.popUntil(AppRoutes.search);
                          context.go(AppRoutes.reservation);
                        });
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
              controller: webViewController,
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
