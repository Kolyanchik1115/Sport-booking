import 'package:fpdart/fpdart.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:sport_app/core/api/grapgql_client.dart';
import 'package:sport_app/core/error/failures.dart';
import 'package:sport_app/data/models/facility/facility_data.dart';
import 'package:sport_app/data/models/facility/facility_response_model.dart';
import 'package:sport_app/data/models/user/user_response_model.dart';
import 'package:sport_app/domain/repositories/auth_repository.dart';
import 'package:sport_app/domain/repositories/facility_repository.dart';

class FacilityRepositoryImpl implements FacilityRepository {
  FacilityRepositoryImpl(this.remoteClient);

  @override
  late final GraphClient remoteClient;

  @override
  Future<Either<Failure, FacilityResponseModel>> getAllFacility({
    required int page,
    String? sportType,
    String? coveringType,
  }) async {
    try {
      final data = {
        "facilitiesFilterInput": {
          "sportType": sportType,
          "coveringType": coveringType,
        },
        "paginationArgs": {"limit": 10, "page": page}
      };
      final result = await remoteClient.getAllFacility(data: data);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
