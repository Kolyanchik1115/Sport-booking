part of 'favorite_cubit.dart';

@freezed
class FavoriteState with _$FavoriteState {
  const factory FavoriteState({
    String? errorMessage,
    bool? isLoading,
    int? updatedFacilityId,
    bool? updatedStatus,
    @Default([]) List<FacilityData> data,
  }) = _FavoriteState;
}
