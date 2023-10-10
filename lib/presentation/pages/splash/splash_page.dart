import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sport_app/core/router/routes.dart';
import 'package:sport_app/presentation/pages/splash/cubit/initial_cubit.dart';
import 'package:sport_app/presentation/widgets/empty_layout.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InitialCubit()..init(),
      child: BlocListener<InitialCubit, InitialState>(
        listener: (context, state) {
          if (state.isAuth == false || state.isAuth == null) {
            context.go(AppRoutes.singIn);
          } else {
            context.go(AppRoutes.singIn);
          }
        },
        child: const EmptyLayout(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
