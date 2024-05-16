import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sport_app/core/router/router_config.dart';
import 'package:sport_app/core/router/routes.dart';
import 'package:sport_app/core/utils/data_parser.dart';
import 'package:sport_app/features/additional_pages/presentation/widgets/custom_error_widget.dart';
import 'package:sport_app/features/additional_pages/presentation/widgets/scaffold_with_app_bar.dart';
import 'package:sport_app/presentation/pages/booking/cubit/booking/booking_cubit.dart';
import 'package:uuid/uuid.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentPage extends StatelessWidget {
  final BookingCubit bookingCubit;
  final String desc;
  final String image;
  final int facilityId;

  const PaymentPage({
    super.key,
    required this.desc,
    required this.bookingCubit,
    required this.facilityId,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bookingCubit,
      child: BlocBuilder<BookingCubit, BookingState>(
        builder: (context, state) {
          String orderId = const Uuid().v4();
          String data =
              DateParser.generatePaymentData('sandbox_i69297607762', orderId, state.totalPrice, 'UAH', desc, 'UK');
          String signature =
              DateParser.generatePaymentSignature('sandbox_1iShFxZY7Xsp9Ab6lGojbEs4mNGy6ngW9BqGBRuv', data);

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
}
