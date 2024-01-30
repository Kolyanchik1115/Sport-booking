import 'package:fpdart/fpdart.dart';
import 'package:sport_app/core/api/grapgql_client.dart';
import 'package:sport_app/core/error/failures.dart';
import 'package:sport_app/data/models/facility/facility_data.dart';
import 'package:sport_app/data/models/facility/facility_response_model.dart';

abstract interface class FacilityRepository {
  final GraphClient remoteClient;

  FacilityRepository(this.remoteClient);

  Future<Either<Failure, FacilityResponseModel>> getAllFacility({
    required int page,
    String? sportType,
    String? coveringType,
    String? search,
    String? facilityType,
  });
}
