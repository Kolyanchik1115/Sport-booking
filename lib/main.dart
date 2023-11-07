import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_app/core/router/router_config.dart';
import 'package:sport_app/core/themes/theme.dart';
import 'package:sport_app/injector.dart' as di;
import 'package:sport_app/injector.dart';

import 'presentation/pages/additions_pages/user/user_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
