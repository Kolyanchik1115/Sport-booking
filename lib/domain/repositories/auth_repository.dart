import 'package:fpdart/fpdart.dart';
import 'package:sport_app/core/api/grapgql_client.dart';
import 'package:sport_app/core/error/failures.dart';
import 'package:sport_app/data/models/user/user_response_model.dart';

abstract interface class AuthorizationRepository {
  final GraphClient remoteClient;

  AuthorizationRepository(this.remoteClient);

  Future<Either<Failure, UserResponseModel>> singIn({required String email, required String password});

}
