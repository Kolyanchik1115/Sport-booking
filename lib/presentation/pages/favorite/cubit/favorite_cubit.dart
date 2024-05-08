import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sport_app/core/error/failures.dart';
import 'package:sport_app/core/usecases/usecases.dart';
import 'package:sport_app/data/models/facility/facility_data.dart';
import 'package:sport_app/domain/usecases/facility/add_favorite.dart';
import 'package:sport_app/domain/usecases/facility/get_all_favorites.dart';
import 'package:sport_app/domain/usecases/facility/remove_favorite.dart';
import 'package:sport_app/injector.dart';

part 'favorite_state.dart';

part 'favorite_cubit.freezed.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(const FavoriteState());

  Future<void> getAllUserFavorites() async {
    emit(state.copyWith(isLoading: true));

    final result = await injector<GetAllFavoritesUseCase>()(NoParams());
    result.fold(
      (error) => emit(state.copyWith(errorMessage: error.runtimeType.toString(), isLoading: false)),
      (data) => emit(state.copyWith(isLoading: false, data: data.getUserFavorites!.facilities)),
    );
    emit(state.copyWith(isLoading: false));
  }

  Future<void> toggleFavorite({required int facilityId, required bool currentStatus}) async {
    emit(state.copyWith(isLoading: true));

    if (currentStatus) {
      final result = await injector<RemoveFavoriteUseCase>()(RemoveFavoriteParams(facilityId: facilityId));
      result.fold(
        (error) => emit(state.copyWith(errorMessage: error.runtimeType.toString(), isLoading: false)),
        (success) => emit(state.copyWith(isLoading: false, updatedFacilityId: facilityId, updatedStatus: false)),
      );
      getAllUserFavorites();
    } else {
      final result = await injector<AddFavoriteUseCase>()(AddFavoriteParams(facilityId: facilityId));
      result.fold(
        (error) => emit(state.copyWith(errorMessage: error.runtimeType.toString(), isLoading: false)),
        (success) => emit(state.copyWith(isLoading: false, updatedFacilityId: facilityId, updatedStatus: true)),
      );
      getAllUserFavorites();
    }
  }
}
