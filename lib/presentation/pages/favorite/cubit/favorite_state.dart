part of 'favorite_cubit.dart';

@freezed
class FavoriteState with _$FavoriteState {
  const factory FavoriteState({
    String? errorMessage,
    bool? isLoading,
    int? updatedFacilityId,
    @Default([]) List<int> removedListId,
    @Default([]) List<FacilityData> data,
  }) = _FavoriteState;
}
