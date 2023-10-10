part of 'sign_in_cubit.dart';

@freezed
class SignInState with _$SignInState {
  const factory SignInState({
    String? emailError,
    String? passwordError,
    @Default(false) bool isLoading,
  }) = _SignInState;
}
