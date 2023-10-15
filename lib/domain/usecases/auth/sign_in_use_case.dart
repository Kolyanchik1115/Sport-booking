import 'package:equatable/equatable.dart';
import 'package:fpdart/src/either.dart';
import 'package:sport_app/core/error/failures.dart';
import 'package:sport_app/core/usecases/usecases.dart';
import 'package:sport_app/data/models/user/user_response_model.dart';
import 'package:sport_app/domain/repositories/auth_repository.dart';

class SignInUserUseCase implements UseCase<UserResponseModel, SignInParams> {
  final AuthorizationRepository repository;

  SignInUserUseCase(this.repository);

  @override
  Future<Either<Failure, UserResponseModel>> call(SignInParams params) async {
    return await repository.singIn(email: params.email, password: params.password);
  }
}

class SignInParams extends Equatable {
  final String email;
  final String password;

  const SignInParams({
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [email, password];
}
