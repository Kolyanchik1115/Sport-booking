import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sport_app/core/error/failures.dart';
import 'package:sport_app/data/models/facility/facility_data.dart';
import 'package:sport_app/data/models/facility/facility_response_model.dart';
import 'package:sport_app/domain/usecases/facility/add_favorite.dart';
import 'package:sport_app/domain/usecases/facility/get_all_facility.dart';
import 'package:sport_app/domain/usecases/facility/remove_favorite.dart';
import 'package:sport_app/injector.dart';

part 'facility_cubit.freezed.dart';

part 'facility_state.dart';

class FacilityCubit extends Cubit<FacilityState> {
  FacilityCubit() : super(const FacilityState());

  int _currentPage = 1;
  List<String>? _sportType;
  String? _coveringType;
  String? _facilityType;

  set facilityType(String? value) {
    _facilityType = value;
  }

  set coveringType(String? value) {
    _coveringType = value;
  }

  set sportType(List<String>? value) {
    _sportType = value;
  }

  Future<void> loadNextPage({String? search}) async {
    if (state.isLoading) return;
    if (_currentPage == 1) emit(state.copyWith(isLoading: true));
    List<FacilityData> facilities = List.of(state.data);
    late final Either<Failure, FacilityResponseModel> result;

    result = await injector<GetAllFacilityUseCase>()(GetAllFacilityParams(
      search: search,
      page: _currentPage,
      sportType: _sportType,
      coveringType: _coveringType,
      facilityType: _facilityType,
    ));

    result.fold(
      (error) {
        emit(state.copyWith(isLoading: false));
      },
      (data) {
        if (_currentPage == 1) {
          facilities = data.findAll!.facilities;
        } else {
          facilities.addAll(data.findAll!.facilities);
        }
        emit(state.copyWith(
          data: facilities,
          currentPage: _currentPage,
          isLoading: false,
          hasReachedEnd: data.findAll!.facilities.isEmpty,
        ));
        _currentPage++;
      },
    );
  }

  void onSearch(String searchTerm) {
    loadFirstPage(search: searchTerm);
  }

  (FacilityData, int) _getFacilityById(int facilityId) {
    final facility = state.data.firstWhere((facility) => facility.id == facilityId);
    final index = state.data.indexWhere((facility) => facility.id == facilityId);
    return (facility, index);
  }

  Future<void> toggleFavorite({required int facilityId}) async {
    final data = _getFacilityById(facilityId);
    final facilityList = state.data.toList();

    if (data.$1.currentUserIsFavorite) {
      final result = await injector<RemoveFavoriteUseCase>()(RemoveFavoriteParams(facilityId: facilityId));
      result.fold(
        (error) => null,
        (success) {
          facilityList[data.$2] = data.$1.copyWith(currentUserIsFavorite: false);
          emit(state.copyWith(data: facilityList, isChangeFavorite: !state.isChangeFavorite));
        },
      );
    } else {
      final result = await injector<AddFavoriteUseCase>()(AddFavoriteParams(facilityId: facilityId));
      result.fold(
        (error) => null,
        (success) {
          facilityList[data.$2] = data.$1.copyWith(currentUserIsFavorite: true);
          emit(state.copyWith(data: facilityList, isChangeFavorite: !state.isChangeFavorite));
        },
      );
    }
  }

  void localRemoveFromFavorite(List<int> ids) {
    final facilityList = state.data.toList();

    for (final i in ids) {
      final data = _getFacilityById(i);
      facilityList[data.$2] = data.$1.copyWith(currentUserIsFavorite: false);
    }
    emit(state.copyWith(data: facilityList.toList(), isChangeFavorite: false));
  }

  Future<void> loadFirstPage({String? search}) async {
    _currentPage = 1;
    loadNextPage(search: search);
  }
}
