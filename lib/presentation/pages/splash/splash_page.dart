import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sport_app/core/router/routes.dart';

// class SplashPage extends StatelessWidget {
//   const SplashPage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => InitialCubit()..init(),
//       child: BlocListener<InitialCubit, InitialState>(
//         listener: (context, state) async {
//           context.go(AppRoutes.singIn);
//         },
//         child: const EmptyLayout(
//           child: Center(
//             child: CircularProgressIndicator(),
//           ),
//         ),
//       ),
//     );
//   }
// }
class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.go(AppRoutes.singIn);
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
