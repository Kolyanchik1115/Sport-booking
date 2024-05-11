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
      (data) => emit(FavoriteState(data: data.getUserFavorites!.facilities)),
    );
    emit(state.copyWith(isLoading: false));
  }

  Future<void> removeFavorite({required int facilityId}) async {
    if (state.isLoading == true) return;
    emit(state.copyWith(isLoading: true));

    final facilityList = state.data.toList();

    final result = await injector<RemoveFavoriteUseCase>()(RemoveFavoriteParams(facilityId: facilityId));
    result.fold(
      (error) => null,
      (success) {
        facilityList.removeWhere((facility) => facilityId == facility.id);
        emit(state.copyWith(data: facilityList, isLoading: false, removedListId: state.removedListId.toList()..add(facilityId)));
      },
    );
    emit(state.copyWith(isLoading: false));
  }
}
