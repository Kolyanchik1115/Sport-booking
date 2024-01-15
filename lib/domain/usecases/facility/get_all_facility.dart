import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';
import 'package:sport_app/core/error/failures.dart';
import 'package:sport_app/core/usecases/usecases.dart';
import 'package:sport_app/data/models/facility/facility_response_model.dart';
import 'package:sport_app/domain/repositories/facility_repository.dart';

class GetAllFacilityUseCase implements UseCase<FacilityResponseModel, GetAllFacilityParams> {
  final FacilityRepository repository;

  GetAllFacilityUseCase(this.repository);

  @override
  Future<Either<Failure, FacilityResponseModel>> call(GetAllFacilityParams params) async {
    return await repository.getAllFacility(
      page: params.page,
      sportType: params.sportType,
      coveringType: params.coveringType,
    );
  }
}

class GetAllFacilityParams extends Equatable {
  final int page;
  final String? sportType;
  final String? coveringType;

  const GetAllFacilityParams({
    required this.page,
    this.sportType,
    this.coveringType,
  });

  @override
  List<Object?> get props => [page];
}
