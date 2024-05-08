import 'package:fpdart/fpdart.dart';
import 'package:sport_app/core/error/failures.dart';
import 'package:sport_app/core/usecases/usecases.dart';
import 'package:sport_app/data/models/facility/facility_response_model.dart';
import 'package:sport_app/domain/repositories/facility_repository.dart';

class GetAllFavoritesUseCase implements UseCase<FacilityResponseModel, NoParams> {
  final FacilityRepository repository;

  GetAllFavoritesUseCase(this.repository);

  @override
  Future<Either<Failure, FacilityResponseModel>> call(NoParams params) async {
    return await repository.getAllUserFavorites();
  }
}
