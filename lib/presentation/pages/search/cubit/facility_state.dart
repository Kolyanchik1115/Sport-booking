part of 'facility_cubit.dart';

@freezed
class FacilityPaginationState with _$FacilityPaginationState {
  const factory FacilityPaginationState({
    @Default([]) List<FacilityData> data,
    @Default(1) int currentPage,
    @Default(false) bool isLoading,
    @Default(false) bool hasReachedEnd,
  }) = _FacilityPaginationState;
}

