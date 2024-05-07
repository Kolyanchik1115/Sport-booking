import 'package:fpdart/fpdart.dart';
import 'package:sport_app/core/api/grapgql_client.dart';
import 'package:sport_app/core/error/failures.dart';
import 'package:sport_app/data/models/facility/facility_response_model.dart';
import 'package:sport_app/data/models/favorite/favorite_response_model.dart';
import 'package:sport_app/domain/repositories/facility_repository.dart';

class FacilityRepositoryImpl implements FacilityRepository {
  FacilityRepositoryImpl(this.remoteClient);

  @override
  late final GraphClient remoteClient;

  @override
  Future<Either<Failure, FacilityResponseModel>> getAllFacility({
    required int page,
    List<String>? sportType,
    String? coveringType,
    String? search,
    String? facilityType,
  }) async {
    try {
      final data = {
        "facilitiesFilterInput": {
          "search": search,
          "sportType": sportType,
          "coveringType": coveringType,
          "facilityType": facilityType,
        },
        "paginationArgs": {"limit": 10, "page": page}
      };
      final result = await remoteClient.getAllFacility(data: data);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, FavoriteResponseModel>> addFavorite({required int facilityId}) async {
    try {
      final data = {"facilityId": facilityId};
      final result = await remoteClient.addFavorite(data: data);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
  @override
  Future<Either<Failure, FavoriteResponseModel>> removeFavorite({required int facilityId}) async {
    try {
      final data = {"facilityId": facilityId};
      final result = await remoteClient.removeFavorite(data: data);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
