part of 'facility_cubit.dart';

@freezed
class FacilityState with _$FacilityState {
  const factory FacilityState({
    @Default([]) List<FacilityData> data,
    @Default(1) int currentPage,
    @Default(false) bool isLoading,
    @Default(false) bool hasReachedEnd,
    @Default(false) bool isChangeFavorite,
  }) = _FacilityPaginationState;
}

