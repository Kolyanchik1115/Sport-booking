import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_app/features/additional_pages/presentation/widgets/empty_layout.dart';

import 'cubit/email_confirmation_deep_link_cubit.dart';

class EmailConfirmationDeepLink extends StatelessWidget {
  const EmailConfirmationDeepLink({super.key});

  @override
  Widget build(BuildContext context) {
    return EmptyLayout(
      child: BlocProvider(
        lazy: false,
        create: (context) => EmailConfirmationDeepLinkCubit()..init(),
        child: Center(
          child: BlocBuilder<EmailConfirmationDeepLinkCubit, EmailConfirmationDeepLinkState>(
            builder: (context, state) {
              return state.when(
                initial: () => const SizedBox(),
                loading: () => const CircularProgressIndicator(),
                info: () => const SizedBox(),
                error: () => const SizedBox(),
              );
            },
          ),
        ),
      ),
    );
  }
}
