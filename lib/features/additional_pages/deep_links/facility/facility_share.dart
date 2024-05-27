import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sport_app/core/router/routes.dart';
import 'package:sport_app/features/additional_pages/deep_links/facility/cubit/facility_deep_link_cubit.dart';
import 'package:sport_app/features/additional_pages/presentation/widgets/empty_layout.dart';

class FacilityShareDeepLink extends StatelessWidget {
  final int id;

  const FacilityShareDeepLink({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return EmptyLayout(
      child: BlocProvider(
        lazy: false,
        create: (context) => FacilityDeepLinkCubit()..init(id),
        child: Center(
          child: BlocBuilder<FacilityDeepLinkCubit, FacilityDeepLinkState>(
            builder: (context, state) {
              return state.when(
                initial: () => const CircularProgressIndicator(),
                error: (message) => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(message),
                    TextButton(
                      child: const Text('OK'),
                      onPressed: () {
                        if (context.canPop()) {
                          context.pop();
                        } else {
                          context.go(AppRoutes.search);
                        }
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
