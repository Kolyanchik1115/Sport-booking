import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';
import 'package:sport_app/core/error/failures.dart';
import 'package:sport_app/core/usecases/usecases.dart';
import 'package:sport_app/data/models/user/user_response_model.dart';
import 'package:sport_app/domain/repositories/auth_repository.dart';

class SignUpUserUseCase implements UseCase<UserResponseModel, SignUpParams> {
  final AuthorizationRepository repository;

  SignUpUserUseCase(this.repository);

  @override
  Future<Either<Failure, UserResponseModel>> call(SignUpParams params) async {
    return await repository.signUp(
      email: params.email,
      password: params.password,
    );
  }
}

class SignUpParams extends Equatable {
  final String email;
  final String password;

  const SignUpParams({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [email, password];
}
