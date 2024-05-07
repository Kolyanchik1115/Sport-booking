import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sport_app/core/api/sport_app_api.dart';
import 'package:sport_app/core/error/failures.dart';
import 'package:sport_app/core/router/router_config.dart';
import 'package:sport_app/core/router/routes.dart';
import 'package:sport_app/core/storage/token_storage.dart';
import 'package:sport_app/core/utils/validation.dart';
import 'package:sport_app/domain/usecases/auth/sign_in_use_case.dart';
import 'package:sport_app/features/additional_pages/presentation/bloc/user/user_cubit.dart';
import 'package:sport_app/injector.dart';

part 'sign_in_cubit.freezed.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(const SignInState());

  void validate(String? email, String? password) {
    final Validation validation = Validation();

    bool isEmailValid = validation.email(email);
    bool isPasswordValid = validation.password(password);

    emit(
      state.copyWith(
        emailError: isEmailValid ? null : 'Incorrect e-mail',
        passwordError: isPasswordValid
            ? null
            : 'Password must be more than 6 characters including at least one number and one character.',
      ),
    );
  }



  Future<void> signIn(String? email, String? password) async {
    await injector<TokenStorage>().removeTokens();
    injector<SportAppApi>().token = '';
    final Validation validation = Validation();

    bool isEmailValid = validation.email(email);
    bool isPasswordValid = validation.password(password);

    if (!isEmailValid || !isPasswordValid) {
      emit(
        state.copyWith(
          emailError: isEmailValid ? null : 'Incorrect e-mail',
          passwordError: isPasswordValid
              ? null
              : 'Password must be more than 6 characters including at least one number and one character.',
        ),
      );

      return;
    }
    emit(state.copyWith(isLoading: true));

    final token = await injector<SignInUserUseCase>()(SignInParams(email: email!, password: password!));

    token.fold(
      (onError) => emit(state.copyWith(
        passwordError: (onError as ServerFailure).message ?? 'Invalid credentials',
        emailError: '',
      )),
      (token) {
        injector<SportAppApi>().token = token.login!.accessToken;
        injector<SportAppApi>().refreshToken = token.login!.refreshToken;
        injector<UserCubit>().setUser(token.login!.user);
        injector<AppRouter>().go(AppRoutes.search);
      },
    );
    emit(state.copyWith(isLoading: false));
  }
}
