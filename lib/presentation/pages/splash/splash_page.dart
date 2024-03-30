import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sport_app/core/router/routes.dart';
import 'package:sport_app/core/storage/token_storage.dart';
import 'package:sport_app/features/additional_pages/presentation/bloc/user/user_cubit.dart';
import 'package:sport_app/features/additional_pages/presentation/widgets/empty_layout.dart';
import 'package:sport_app/injector.dart';
import 'package:sport_app/presentation/pages/splash/cubit/initial_cubit.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InitialCubit()..init(),
      child: BlocListener<InitialCubit, InitialState>(
        listener: (context, state) async {
          if (state.isAuth == false || state.isAuth == null) {
            injector<TokenStorage>().removeTokens();
            context.go(AppRoutes.signIn);
          } else {
            injector<UserCubit>().update();
            context.go(AppRoutes.search);
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
