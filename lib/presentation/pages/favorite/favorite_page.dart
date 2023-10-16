import 'package:flutter/material.dart';
import 'package:sport_app/core/router/router_config.dart';
import 'package:sport_app/core/router/routes.dart';
import 'package:sport_app/core/storage/token_storage.dart';
import 'package:sport_app/injector.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () async {
          await injector<TokenStorage>().removeTokens();
           injector<AppRouter>().go(AppRoutes.splashPage);
        },
        child: const Text("Logout"),
      ),
    );
  }
}
