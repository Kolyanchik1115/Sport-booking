import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sport_app/data/models/facility/facility_data.dart';
import 'package:sport_app/domain/usecases/facility/get_all_facility.dart';
import 'package:sport_app/injector.dart';

part 'facility_cubit.freezed.dart';

part 'facility_state.dart';

class FacilityCubit extends Cubit<FacilityState> {
  FacilityCubit() : super(const FacilityState());

  int _currentPage = 1;
  String? _sportType;
  String? _coveringType;

  set coveringType(String? value) {
    _coveringType = value;
  }

  set sportType(String? value) {
    _sportType = value;
  }

  Future<void> loadNextPage() async {
    if (state.isLoading) return;
    if (_currentPage == 1) emit(state.copyWith(isLoading: true));

    List<FacilityData> facilities = List.of(state.data);

    final result = await injector<GetAllFacilityUseCase>()(GetAllFacilityParams(
      page: _currentPage,
      sportType: _sportType,
      coveringType: _coveringType,
    ));
    result.fold(
      (error) {
        emit(state.copyWith(isLoading: false));
      },
      (data) {
        if (_currentPage == 1) {
          facilities = data.findAll.facilities;
        } else {
          facilities.addAll(data.findAll.facilities);
        }
        emit(state.copyWith(
          data: facilities,
          currentPage: _currentPage,
          isLoading: false,
          hasReachedEnd: data.findAll.facilities.isEmpty,
        ));
        _currentPage++;
      },
    );
  }

  Future<void> loadFirstPage() async {
    _currentPage = 1;
    loadNextPage();
  }
}
