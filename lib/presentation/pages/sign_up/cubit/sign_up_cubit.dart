import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sport_app/core/api/sport_app_api.dart';
import 'package:sport_app/core/router/router_config.dart';
import 'package:sport_app/core/router/routes.dart';
import 'package:sport_app/core/utils/validation.dart';
import 'package:sport_app/domain/usecases/auth/sign_in_use_case.dart';
import 'package:sport_app/domain/usecases/auth/sign_up_use_case.dart';
import 'package:sport_app/features/additional_pages/presentation/bloc/user/user_cubit.dart';
import 'package:sport_app/injector.dart';

part 'sign_up_cubit.freezed.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(const SignUpState());

  void clear() {
    emit(const SignUpState());
  }

  void validate(String? email, String? password, String? confirmedPassword) async {
    final Validation validation = Validation();

    bool isEmailValid = validation.email(email);
    bool isPasswordValid = validation.password(password);
    bool isConfirmPasswordValid = password == confirmedPassword;

    emit(
      state.copyWith(
        emailError: isEmailValid ? null : 'Incorrect e-mail format',
        passwordError: isPasswordValid
            ? null
            : 'Password must be more than 6 characters including at least one number and one character.',
        confirmPasswordError: isConfirmPasswordValid ? null : 'The passwords do not coincide.',
      ),
    );
    if (isEmailValid && isPasswordValid && isConfirmPasswordValid) {
      injector<AppRouter>().config.configuration.routes;
      signUp(email, password, confirmedPassword);
    }
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
            confirmPasswordError: null,
          ),
        );
      },
      (response) {
        injector<SportAppApi>().token = response.register!.accessToken;
        injector<SportAppApi>().refreshToken = response.register!.refreshToken;
        injector<UserCubit>().setUser(response.register!.user);
        injector<AppRouter>().goNamed(AppRoutes.singUpVerificationStep);
      },
    );

    emit(state.copyWith(isLoading: false));
  }
}
