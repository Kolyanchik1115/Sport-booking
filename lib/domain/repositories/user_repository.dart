import 'package:fpdart/fpdart.dart';
import 'package:sport_app/core/api/grapgql_client.dart';
import 'package:sport_app/core/error/failures.dart';
import 'package:sport_app/data/models/user/user_data.dart';

abstract interface class UserRepository {
  final GraphClient remoteClient;

  UserRepository(this.remoteClient);

  Future<Either<Failure, UserData>> getUser();
}
