import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';
import 'package:sport_app/core/error/failures.dart';
import 'package:sport_app/core/usecases/usecases.dart';
import 'package:sport_app/data/models/user/user_response_model.dart';
import 'package:sport_app/domain/repositories/auth_repository.dart';

class GoogleSignInUserUseCase implements UseCase<UserResponseModel, GoogleSignInParams> {
  final AuthorizationRepository repository;

  GoogleSignInUserUseCase(this.repository);

  @override
  Future<Either<Failure, UserResponseModel>> call(GoogleSignInParams params) async {
    return await repository.googleSignIn(token: params.token);
  }
}

class GoogleSignInParams extends Equatable {
  final String token;

  const GoogleSignInParams({
    required this.token,
  });

  @override
  List<Object> get props => [token];
}
