import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sport_app/core/router/routes.dart';
import 'package:sport_app/presentation/widgets/default_input_text_field.dart';
import 'package:sport_app/presentation/widgets/empty_layout.dart';
import 'package:sport_app/presentation/widgets/password_input_text_field.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _emailEditingController = TextEditingController();
  final TextEditingController _passwordEditingController = TextEditingController();

  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  @override
  void dispose() {
    _emailEditingController.dispose();
    _passwordEditingController.dispose();

    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
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
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: IntrinsicHeight(
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
                            child: Column(
                              children: [
                                const SizedBox(height: 16.0),
                                DefaultInputTextField(
                                  textEditingController: _emailEditingController,
                                  focusNode: _emailFocusNode,

                                  onEditingComplete: () {
                                    FocusScope.of(context).requestFocus(_passwordFocusNode);
                                  },
                                  onChanged: (value) {},
                                  hintText: 'Email',
                                ),
                                PasswordInputTextField(
                                  textEditingController: _passwordEditingController,
                                  focusNode: _passwordFocusNode,
                                  onChanged: (value) {},
                                  hintText: 'Password',
                                ),
                                const SizedBox(height: 38.0),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: TextButton(
                                    child: Text(
                                      'Sign In',
                                      style: TextStyle(
                                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                                      ),
                                    ),
                                    onPressed: () {},
                                  ),
                                ),
                                const Spacer(),
                                RichText(
                                  text: TextSpan(
                                    text: 'New in SportBooking?',
                                    style: Theme.of(context).textTheme.displayMedium,
                                    children: [
                                      TextSpan(
                                        text: ' Sign Up',
                                        style: Theme.of(context).textTheme.displayMedium,
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            context.pushReplacement(AppRoutes.singUp);
                                          },
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 8.0),
                              ],
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
