import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sport_app/core/router/router_config.dart';
import 'package:sport_app/core/router/routes.dart';
import 'package:sport_app/injector.dart';

part 'email_confirmation_deep_link_cubit.freezed.dart';
part 'email_confirmation_deep_link_state.dart';

class EmailConfirmationDeepLinkCubit extends Cubit<EmailConfirmationDeepLinkState> {
  EmailConfirmationDeepLinkCubit() : super(const EmailConfirmationDeepLinkState.initial());

  init() async {
    emit(const EmailConfirmationDeepLinkState.loading());
    injector<AppRouter>().go(AppRoutes.favorites);
    // final Validation validation = Validation();
    // final signUpState = injector<SignUpCubit>().state;
    // final router = injector<AppRouter>();
    //
    // if (signUpState.email == null || signUpState.password == null) {
    //   injector<SignUpCubit>().clear();
    //   router.go(AppRoutes.signIn);
    //   return;
    // }
    //
    // bool isEmailValid = validation.email(signUpState.email);
    // bool isPasswordValid = validation.password(signUpState.password);
    //
    // if (!isEmailValid || !isPasswordValid) {
    //   router.go(AppRoutes.signIn);
    //   return;
    // }

    // final response = await injector<SignInUserUseCase>()(SignInParams(
    //   email: signUpState.email!,
    //   password: signUpState.password!,
    // ));
    //
    // response.fold(
    //   (onError) {
    //     injector<AppRouter>().go(AppRoutes.signIn);
    //   },
    //   (token) {
    //     injector<SportAppApi>().token = token.register!.accessToken;
    //     injector<SportAppApi>().refreshToken = token.register!.refreshToken;
    //     injector<UserCubit>().setUser(token.register!.user);
    //     injector<AppRouter>().go(AppRoutes.search);
    //   },
    // );
  }
}
