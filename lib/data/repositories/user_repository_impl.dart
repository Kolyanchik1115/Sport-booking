import 'dart:convert';
import 'dart:io';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart';
import 'package:http_parser/http_parser.dart';
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
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserData>> updateUserProfile({
    required String? fullname,
    required DateTime? dateOfBirth,
    required File? avatar,
  }) async {
    try {
      final byteData = avatar?.readAsBytesSync();
      final data = {
        "profileInput": {
          "fullname": fullname,
          "dateOfBirth": dateOfBirth?.toIso8601String(),
        },
        "avatar": avatar != null
            ? MultipartFile.fromBytes(
                'photo',
                byteData!,
                filename: '${DateTime.now().millisecondsSinceEpoch}.jpg',
                contentType: MediaType("image", "jpg"),
              )
            : null,
      };
      final result = await remoteClient.updateUserData(data: data);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
