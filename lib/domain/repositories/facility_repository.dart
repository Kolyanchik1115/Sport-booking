import 'package:fpdart/fpdart.dart';
import 'package:sport_app/core/api/grapgql_client.dart';
import 'package:sport_app/core/error/failures.dart';
import 'package:sport_app/data/models/facility/facility_response_model.dart';
import 'package:sport_app/data/models/favorite/favorite_response_model.dart';

abstract interface class FacilityRepository {
  final GraphClient remoteClient;

  FacilityRepository(this.remoteClient);

  Future<Either<Failure, FacilityResponseModel>> getAllFacility({
    required int page,
    List<String>? sportType,
    String? coveringType,
    String? search,
    String? facilityType,
  });

  Future<Either<Failure, FavoriteResponseModel>> addFavorite({required int facilityId});
  Future<Either<Failure, FavoriteResponseModel>> removeFavorite({required int facilityId});


}
