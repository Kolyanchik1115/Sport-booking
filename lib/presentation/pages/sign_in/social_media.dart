import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_app/core/themes/app_assets.dart';
import 'package:sport_app/presentation/pages/sign_in/cubit/social_sign_in/social_auth_cubit.dart';
import 'package:sport_app/presentation/widgets/svg_button.dart';

class SocialMediaAuth extends StatelessWidget {
  const SocialMediaAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SocialAuthCubit(),
      child: BlocConsumer<SocialAuthCubit, SocialAuthState>(
        listener: (context, state) {
          if (state.message.isNotEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                behavior: SnackBarBehavior.floating,
                duration: const Duration(milliseconds: 1750),
                margin: const EdgeInsets.only(bottom: 8.0, left: 16.0, right: 16.0),
                content: Text(
                  state.message,
                  style:
                      Theme.of(context).textTheme.bodyMedium!.copyWith(color: Theme.of(context).colorScheme.background),
                ),
                backgroundColor: Theme.of(context).colorScheme.error,
              ),
            );
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgButton(
                        onTap: () {
                          context.read<SocialAuthCubit>().signInWithGoogle();
                        },
                        asset: AppSvg.google),
                    if (Platform.isIOS) const SizedBox(width: 24.0),
                    if (Platform.isIOS)
                      SvgButton(
                        onTap: () {},
                        asset: AppSvg.apple,
                      ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
