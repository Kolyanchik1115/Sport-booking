part of 'filter_cubit.dart';

@freezed
class FilterState with _$FilterState {
  const factory FilterState({
    String? selectedSportType,
    String? selectedCoveringType,
  }) = _FilterState;
}
