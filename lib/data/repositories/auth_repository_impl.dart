import 'package:fpdart/fpdart.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:sport_app/core/api/grapgql_client.dart';
import 'package:sport_app/core/error/failures.dart';
import 'package:sport_app/data/models/user/user_response.dart';
import 'package:sport_app/data/models/user/user_response_model.dart';
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
    } on StateError {
      return Left(ServerFailure(message: "Internet Error"));
    } on GraphQLError catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return Left(ServerFailure(message: "An unexpected error occurred"));
    }
  }

  @override
  Future<Either<Failure, UserResponseModel>> signUp({required String email, required String password}) async {
    try {
      final user = await remoteClient.signUp(data: {
        "registerInput": {"email": email, "password": password, "confirmPassword": password}
      });
      return Right(user);
    } on StateError {
      return Left(ServerFailure(message: "Internet Error"));
    } on GraphQLError catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return Left(ServerFailure(message: "An unexpected error occurred"));
    }
  }

  @override
  Future<Either<Failure, UserResponseModel>> googleSignIn({required String token}) async {
    try {
      final user = await remoteClient.googleSignIn(data: {"token": token});
      return Right(user);
    } on StateError {
      return Left(ServerFailure(message: "Internet Error"));
    } on GraphQLError catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return Left(ServerFailure(message: "An unexpected error occurred"));
    }
  }
}
