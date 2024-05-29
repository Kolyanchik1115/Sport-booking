import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sport_app/core/router/routes.dart';
import 'package:sport_app/features/additional_pages/presentation/widgets/arrow_button.dart';
import 'package:sport_app/features/additional_pages/presentation/widgets/default_input_text_field.dart';
import 'package:sport_app/features/additional_pages/presentation/widgets/empty_layout.dart';
import 'package:sport_app/features/additional_pages/presentation/widgets/password_input_text_field.dart';
import 'package:sport_app/injector.dart';
import 'package:sport_app/presentation/pages/sign_up/cubit/sign_up_cubit.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _emailEditingController = TextEditingController();
  final TextEditingController _passwordEditingController = TextEditingController();
  final TextEditingController _confirmPasswordEditingController = TextEditingController();

  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _confirmPasswordFocusNode = FocusNode();

  @override
  void dispose() {
    _emailEditingController.dispose();
    _passwordEditingController.dispose();
    _confirmPasswordEditingController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return EmptyLayout(
      background: Theme.of(context).colorScheme.background,
      systemNavigationBarColor: Theme.of(context).colorScheme.background,
      systemNavigationBarIconBrightness: Brightness.dark,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: viewportConstraints.maxHeight,
            ),
            child: IntrinsicHeight(
              child: BlocProvider(
                create: (context) => injector<SignUpCubit>(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Expanded(flex: 2, child: SizedBox.shrink()),
                    Expanded(
                      flex: 4,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                        ),
                        child: ColoredBox(
                          color: Theme.of(context).colorScheme.background,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0),
                            child: BlocBuilder<SignUpCubit, SignUpState>(
                              builder: (context, state) {
                                return Column(
                                  children: [
                                    const SizedBox(height: 16.0),
                                    DefaultInputTextField(
                                      textEditingController: _emailEditingController,
                                      focusNode: _emailFocusNode,
                                      error: state.emailError,
                                      onEditingComplete: () => FocusScope.of(context).requestFocus(_passwordFocusNode),
                                      onChanged: (value) {
                                        if (state.passwordError != null || state.emailError != null) {
                                          injector<SignUpCubit>().validate(
                                            _passwordEditingController.text,
                                            _confirmPasswordEditingController.text,
                                            _emailEditingController.text,
                                          );
                                        }
                                      },
                                      hintText: 'Email',
                                    ),
                                    PasswordInputTextField(
                                      textEditingController: _passwordEditingController,
                                      focusNode: _passwordFocusNode,
                                      error: state.passwordError,
                                      onEditingComplete: () =>
                                          FocusScope.of(context).requestFocus(_confirmPasswordFocusNode),
                                      onChanged: (value) {
                                        if (state.passwordError != null || state.emailError != null) {
                                          injector<SignUpCubit>().validate(
                                            _passwordEditingController.text,
                                            _confirmPasswordEditingController.text,
                                            _emailEditingController.text,
                                          );
                                        }
                                      },
                                      hintText: 'Password',
                                    ),
                                    PasswordInputTextField(
                                      textEditingController: _confirmPasswordEditingController,
                                      focusNode: _confirmPasswordFocusNode,
                                      error: state.confirmPasswordError,
                                      onChanged: (value) {
                                        if (state.passwordError != null || state.emailError != null) {
                                          injector<SignUpCubit>().validate(
                                            _passwordEditingController.text,
                                            _confirmPasswordEditingController.text,
                                            _emailEditingController.text,
                                          );
                                        }
                                      },
                                      hintText: 'Confirm password',
                                    ),
                                    const SizedBox(height: 16.0),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: ArrowButton(
                                        isLoading: state.isLoading,
                                        title: 'Continue',
                                        padding: const EdgeInsets.only(right: 20.0),
                                        onTap: () {
                                          injector<SignUpCubit>().validate(
                                            _emailEditingController.text.trim(),
                                            _passwordEditingController.text.trim(),
                                            _confirmPasswordEditingController.text.trim(),
                                          );
                                        },
                                      ),
                                    ),
                                    const SizedBox(height: 16.0),
                                    const Spacer(),
                                    RichText(
                                      text: TextSpan(
                                        text: 'Already have an account?',
                                        style: Theme.of(context).textTheme.displayMedium,
                                        children: [
                                          TextSpan(
                                            text: ' Sign In',
                                            style: Theme.of(context).textTheme.displayMedium,
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {
                                                context.pushReplacement(AppRoutes.signIn);
                                              },
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 8.0),
                                  ],
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
