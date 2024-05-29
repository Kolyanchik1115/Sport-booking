import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sport_app/core/themes/app_assets.dart';
import 'package:sport_app/features/additional_pages/presentation/widgets/empty_layout.dart';
import 'package:sport_app/injector.dart';
import 'package:sport_app/presentation/pages/sign_up/cubit/sign_up_cubit.dart';

class SignUpVerificationStep extends StatelessWidget {
  const SignUpVerificationStep({super.key});

  @override
  Widget build(BuildContext context) {
    return EmptyLayout(
      systemNavigationBarColor: Theme.of(context).colorScheme.background,
      systemNavigationBarIconBrightness: Brightness.dark,
      child: BlocProvider(
        create: (context) => injector<SignUpCubit>(),
        child: BlocBuilder<SignUpCubit, SignUpState>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () => context.pop(),
                        child: Container(
                          padding: const EdgeInsets.only(left: 16.0),
                          alignment: Alignment.centerLeft,
                          child: RotatedBox(
                            quarterTurns: 2,
                            child: SvgPicture.asset(
                              AppSvg.arrow,
                              width: 30.0,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        'Verify',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const SizedBox(height: 16.0),
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                    child: ColoredBox(
                      color: Theme.of(context).colorScheme.background,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Column(
                          children: [
                            const SizedBox(height: 10.0),
                            Text(
                              'A verification link has been sent to  your email account. Please click on the link to finish signing up',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(color: Theme.of(context).colorScheme.primary),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 80.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    text: 'Didn’t get a link?',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge
                                        ?.copyWith(color: Theme.of(context).colorScheme.secondary),
                                    children: [
                                      TextSpan(
                                        text: '  Resend',
                                        style: Theme.of(context).textTheme.titleLarge,
                                        recognizer: TapGestureRecognizer()..onTap = () {},
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16.0),
                            if (state.continueError != null)
                              Text(
                                state.continueError!,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(color: Theme.of(context).colorScheme.error),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
