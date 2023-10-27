import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:sport_app/core/api/sport_app_api.dart';
import 'package:sport_app/core/router/router_config.dart';
import 'package:sport_app/core/storage/token_storage.dart';
import 'package:sport_app/core/themes/theme.dart';
import 'package:sport_app/injector.dart' as di;
import 'package:sport_app/injector.dart';

import 'presentation/pages/aditions_pages/user/user_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  di.init();
  await initApi();
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
          lazy: false,
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

Future<void> initApi() async {
  final storage = injector<TokenStorage>();
  final String token = await storage.getToken();
  final String refreshToken = await storage.getRefreshToken();

  if (token.isEmpty && refreshToken.isEmpty) {
    return;
  }


  injector<SportAppApi>().token = token;
  injector<SportAppApi>().refreshToken = refreshToken;

  await injector<UserCubit>().update();

  if(Jwt.isExpired(token)){
    await injector<SportAppApi>().updateToken(refreshToken);
  }
}
