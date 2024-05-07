import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sport_app/core/error/failures.dart';
import 'package:sport_app/domain/usecases/facility/add_favorite.dart';
import 'package:sport_app/domain/usecases/facility/remove_favorite.dart';
import 'package:sport_app/injector.dart';

part 'favorite_state.dart';

part 'favorite_cubit.freezed.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(const FavoriteState());

  Future<void> addFavorite({required int facilityId}) async {
    emit(state.copyWith(isLoading: true));

    final data = await injector<AddFavoriteUseCase>()(AddFavoriteParams(facilityId: facilityId));

    data.fold(
      (error) => emit(state.copyWith(errorMessage: error.runtimeType.toString(), isLoading: false)),
      (favorite) => emit(state.copyWith(errorMessage: 'Add to your favorite successfully', isLoading: false)),
    );
    emit(state.copyWith(isLoading: false));
  }

  Future<void> removeFavorite({required int facilityId}) async {
    emit(state.copyWith(isLoading: true));

    final data = await injector<RemoveFavoriteUseCase>()(RemoveFavoriteParams(facilityId: facilityId));

    data.fold(
      (error) => emit(state.copyWith(errorMessage: error.runtimeType.toString(), isLoading: false)),
      (favorite) => emit(state.copyWith(isLoading: false)),
    );
    emit(state.copyWith(isLoading: false));
  }
}
