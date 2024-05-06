part of 'filter_cubit.dart';

@freezed
class FilterState with _$FilterState {
  const factory FilterState({
    List<String>? selectedSportType,
    String? selectedCoveringType,
    String? selectedFacilityType,
  }) = _FilterState;
}
