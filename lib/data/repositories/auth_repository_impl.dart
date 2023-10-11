import 'package:fpdart/fpdart.dart';
import 'package:sport_app/core/api/app_api.dart';
import 'package:sport_app/core/error/failures.dart';
import 'package:sport_app/data/models/user_response_model.dart';
import 'package:sport_app/domain/repositories/auth_repository.dart';

class AuthorizationRepositoryImpl implements AuthorizationRepository {
  AuthorizationRepositoryImpl(this.remoteClient);

  @override
  late final GraphClient remoteClient;

  @override
  Future<Either<Failure, UserResponseModel>> singIn({required String email, required String password}) async {
    try {
      final token = await remoteClient.signIn(data: {
        "loginInput": {"email": email, "password": password}
      });
      return Right(token);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
