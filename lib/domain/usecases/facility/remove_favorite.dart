import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';
import 'package:sport_app/core/error/failures.dart';
import 'package:sport_app/core/usecases/usecases.dart';
import 'package:sport_app/data/models/facility/facility_response_model.dart';
import 'package:sport_app/data/models/favorite/favorite_response_model.dart';
import 'package:sport_app/domain/repositories/facility_repository.dart';

class RemoveFavoriteUseCase implements UseCase<FavoriteResponseModel, RemoveFavoriteParams> {
  final FacilityRepository repository;

  RemoveFavoriteUseCase(this.repository);

  @override
  Future<Either<Failure, FavoriteResponseModel>> call(RemoveFavoriteParams params) async {
    return await repository.removeFavorite(facilityId: params.facilityId);
  }
}

class RemoveFavoriteParams extends Equatable {
  final int facilityId;

  const RemoveFavoriteParams({required this.facilityId});

  @override
  List<Object?> get props => [facilityId];
}
