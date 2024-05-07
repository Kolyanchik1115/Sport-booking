import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';
import 'package:sport_app/core/error/failures.dart';
import 'package:sport_app/core/usecases/usecases.dart';
import 'package:sport_app/data/models/facility/facility_response_model.dart';
import 'package:sport_app/data/models/favorite/favorite_response_model.dart';
import 'package:sport_app/domain/repositories/facility_repository.dart';

class AddFavoriteUseCase implements UseCase<FavoriteResponseModel, AddFavoriteParams> {
  final FacilityRepository repository;

  AddFavoriteUseCase(this.repository);

  @override
  Future<Either<Failure, FavoriteResponseModel>> call(AddFavoriteParams params) async {
    return await repository.addFavorite(facilityId: params.facilityId);
  }
}

class AddFavoriteParams extends Equatable {
  final int facilityId;

  const AddFavoriteParams({required this.facilityId});

  @override
  List<Object?> get props => [facilityId];
}
