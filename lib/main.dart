import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_app/core/router/router_config.dart';
import 'package:sport_app/core/themes/theme.dart';
import 'package:sport_app/features/additional_pages/presentation/bloc/user/user_cubit.dart';
import 'package:sport_app/injector.dart' as di;
import 'package:sport_app/injector.dart';
import 'package:sport_app/presentation/pages/sign_up/cubit/sign_up_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          lazy: false,
          create: (context) => injector<UserCubit>(),
        ),
      ],
      child: MaterialApp.router(
        title: 'Sport-booking',
        debugShowCheckedModeBanner: false,
        theme: theme,
        routerConfig: injector<AppRouter>().config,
      ),
    );
  }
}
