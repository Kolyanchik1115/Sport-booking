part of 'favorite_cubit.dart';

@freezed
class FavoriteState with _$FavoriteState {
  const factory FavoriteState({
    @Default(false) isLoading,
    String? errorMessage,
  }) = _FavoriteState;
}

