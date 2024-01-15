import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'filter_cubit.freezed.dart';

part 'filter_state.dart';

class FilterCubit extends Cubit<FilterState> {
  final List<String> _sportTypeList;
  final List<String> _coveringTypeList;

  FilterCubit({required List<String> sportTypeList, required List<String> coveringTypeList})
      : _coveringTypeList = coveringTypeList,
        _sportTypeList = sportTypeList,
        super(const FilterState());

  List<String> get sportTypeList => _sportTypeList;
  List<String> get coveringTypeList => _coveringTypeList;
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

  void selectCoveringTypeFilterIndex(String? value) {
    emit(state.copyWith(selectedCoveringType: value));
  }

  void resetFilters() {
    emit(const FilterState());
  }
}
