import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'filter_cubit.freezed.dart';

part 'filter_state.dart';

class FilterCubit extends Cubit<FilterState> {
  final List<String> _sportTypeList;
  final List<String> _coveringTypeList;
  final List<String> _facilityTypeList;

  FilterCubit(
      {required List<String> sportTypeList,
      required List<String> coveringTypeList,
      required List<String> facilityTypeList})
      : _coveringTypeList = coveringTypeList,
        _sportTypeList = sportTypeList,
        _facilityTypeList = facilityTypeList,
        super(const FilterState());

  List<String> get sportTypeList => _sportTypeList;
  List<String> get coveringTypeList => _coveringTypeList;
  List<String> get facilityTypeList => _facilityTypeList;


  FilterState _lastUsedState = const FilterState();

  // for save old state (without sending request on server)
  FilterState? get onSubmit {
    if (state == _lastUsedState) {
      return null;
    } else {
      _lastUsedState = state;
      return state;
    }
  }

  void selectSportTypeFilterIndex(String? value) {
    emit(state.copyWith(selectedSportType: value));
  }

  void selectFacilityTypeFilterIndex(String? value) {
    emit(state.copyWith(selectedFacilityType: value));
  }

  void selectCoveringTypeFilterIndex(String? value) {
    emit(state.copyWith(selectedCoveringType: value));
  }

  void resetFilters() {
    emit(const FilterState());
  }
}
