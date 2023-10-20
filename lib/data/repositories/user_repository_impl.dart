import 'package:fpdart/fpdart.dart';
import 'package:sport_app/core/api/grapgql_client.dart';
import 'package:sport_app/core/error/failures.dart';
import 'package:sport_app/data/models/user/user_data.dart';
import 'package:sport_app/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl(this.remoteClient);

  @override
  late final GraphClient remoteClient;

  @override
  Future<Either<Failure, UserData>> getUser() async {
    try {
      final UserData user = await remoteClient.getProfile();
      return Right(user);
    } catch (_) {
      return Left(ServerFailure());
    }
  }
}
