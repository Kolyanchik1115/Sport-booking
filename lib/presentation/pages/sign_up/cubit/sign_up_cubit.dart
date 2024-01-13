import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sport_app/core/api/sport_app_api.dart';
import 'package:sport_app/core/router/router_config.dart';
import 'package:sport_app/core/router/routes.dart';
import 'package:sport_app/core/utils/validation.dart';
import 'package:sport_app/domain/usecases/auth/sign_up_use_case.dart';
import 'package:sport_app/injector.dart';
import 'package:sport_app/presentation/pages/additions_pages/user/user_cubit.dart';

part 'sign_up_cubit.freezed.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(const SignUpState());

  void validate(String? email, String? password, String? confirmedPassword) async {
    final Validation validation = Validation();

    bool isEmailValid = validation.email(email);
    bool isPasswordValid = validation.password(password);
    bool isConfirmPasswordValid = password == confirmedPassword;

    emit(
      state.copyWith(
        emailError: isEmailValid ? null : 'Incorrect e-mail',
        passwordError: isPasswordValid
            ? null
            : 'Password must be more than 6 characters including at least one number and one character.',
        confirmPasswordError: isConfirmPasswordValid ? null : 'The passwords do not coincide.',
      ),
    );
  }

  Future<void> signUp(String? email, String? password, String? confirmedPassword) async {
    emit(state.copyWith(email: email, password: password));

    final Validation validation = Validation();

    bool isEmailValid = validation.email(email);
    bool isPasswordValid = validation.password(password);
    bool isConfirmPasswordValid = password == confirmedPassword;


    if (!isEmailValid || !isPasswordValid || !isConfirmPasswordValid) {
      emit(
        state.copyWith(
          emailError: isEmailValid ? null : 'Incorrect e-mail',
          passwordError: isPasswordValid
              ? null
              : 'Password must be more than 6 characters including at least one number and one character.',
          confirmPasswordError: isConfirmPasswordValid ? null : 'The passwords do not coincide.',
        ),
      );

      return;
    }
    emit(state.copyWith(isLoading: true));

    final response = await injector<SignUpUserUseCase>()(
      SignUpParams(
        email: state.email!,
        password: state.password!,
      ),
    );

    response.fold(
      (onError) {
        emit(
          state.copyWith(
            isLoading: false,
            emailError: 'Email is already taken',
            passwordError: null,
          ),
        );
      },
      (token) {
        injector<SportAppApi>().token = token.register!.accessToken;
        injector<SportAppApi>().refreshToken = token.register!.refreshToken;
        injector<UserCubit>().setUser(token.register!.user);
        injector<AppRouter>().go(AppRoutes.search);
      },
    );
    emit(state.copyWith(isLoading: false));
  }

}
