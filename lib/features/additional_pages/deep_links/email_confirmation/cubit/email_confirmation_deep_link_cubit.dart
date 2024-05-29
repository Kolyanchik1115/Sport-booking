import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sport_app/core/api/sport_app_api.dart';
import 'package:sport_app/core/router/router_config.dart';
import 'package:sport_app/core/router/routes.dart';
import 'package:sport_app/core/utils/validation.dart';
import 'package:sport_app/domain/usecases/auth/sign_in_use_case.dart';
import 'package:sport_app/features/additional_pages/presentation/bloc/user/user_cubit.dart';
import 'package:sport_app/injector.dart';
import 'package:sport_app/presentation/pages/sign_up/cubit/sign_up_cubit.dart';

part 'email_confirmation_deep_link_cubit.freezed.dart';

part 'email_confirmation_deep_link_state.dart';

class EmailConfirmationDeepLinkCubit extends Cubit<EmailConfirmationDeepLinkState> {
  EmailConfirmationDeepLinkCubit() : super(const EmailConfirmationDeepLinkState.initial());

  init() async {
    emit(const EmailConfirmationDeepLinkState.loading());
    emit(const EmailConfirmationDeepLinkState.loading());

    final Validation validation = Validation();
    final signUpState = injector<SignUpCubit>().state;
    final router = injector<AppRouter>();

    if (signUpState.email == null || signUpState.password == null) {
      injector<SignUpCubit>().clear();
      router.go(AppRoutes.signIn);
      return;
    }

    bool isEmailValid = validation.email(signUpState.email);
    bool isPasswordValid = validation.password(signUpState.password);

    if (!isEmailValid || !isPasswordValid) {
      router.go(AppRoutes.signIn);
      return;
    }

    final response = await injector<SignInUserUseCase>()(SignInParams(
      email: signUpState.email!,
      password: signUpState.password!,
    ));

    response.fold(
      (onError) {
        injector<AppRouter>().go(AppRoutes.signIn);
      },
      (token) {
        injector<SportAppApi>().token = token.login!.accessToken;
        injector<SportAppApi>().refreshToken = token.login!.refreshToken;
        injector<UserCubit>().setUser(token.login!.user);
        injector<AppRouter>().go(AppRoutes.search);
      },
    );
  }
}
