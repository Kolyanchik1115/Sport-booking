import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'sign_in_cubit.freezed.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(const SignInState());

  Future<void> signIn(String? email, String? password) async {}
}
