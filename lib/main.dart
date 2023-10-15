import 'package:flutter/material.dart';
import 'package:sport_app/core/router/router_config.dart';
import 'package:sport_app/core/themes/theme.dart';
import 'package:sport_app/injector.dart' as di;
import 'package:sport_app/injector.dart';

void main() async {
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: theme,
      routerConfig: injector<AppRouter>().config,
    );
  }
}
