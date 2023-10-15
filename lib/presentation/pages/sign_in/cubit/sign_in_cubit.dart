import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sport_app/core/router/router_config.dart';
import 'package:sport_app/core/router/routes.dart';
import 'package:sport_app/domain/usecases/auth/sign_in_use_case.dart';
import 'package:sport_app/injector.dart';

part 'sign_in_cubit.freezed.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(const SignInState());

  Future<void> signIn(String? email, String? password) async {
    emit(state.copyWith(isLoading: true));

    final token = await injector<SignInUserUseCase>()(SignInParams(email: email!, password: password!));

    token.fold(
      (onError) => emit(state.copyWith(emailError: "email error", passwordError: "password error")),
      (token) {
        injector<AppRouter>().go(AppRoutes.home);
      },
    );
    emit(state.copyWith(isLoading: false));
  }
}
