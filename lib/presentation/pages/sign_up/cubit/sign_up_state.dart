part of 'sign_up_cubit.dart';

@freezed
class SignUpState with _$SignUpState {
  const factory SignUpState({
    String? email,
    String? password,
    String? emailError,
    String? passwordError,
    String? confirmPasswordError,
    String? userDataError,
    String? continueError,
    @Default(false) bool isLoading,
  }) = _SignUpState;
}