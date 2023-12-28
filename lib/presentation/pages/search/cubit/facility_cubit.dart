import 'dart:ffi';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sport_app/data/models/facility/facility_data.dart';
import 'package:sport_app/domain/usecases/facility/get_all_facility.dart';
import 'package:sport_app/injector.dart';

part 'facility_state.dart';

part 'facility_cubit.freezed.dart';

class FacilityPaginationCubit extends Cubit<FacilityPaginationState> {
  FacilityPaginationCubit() : super(const FacilityPaginationState());

  int _currentPage = 1;

  Future<void> loadNextPage() async {
    emit(state.copyWith(isLoading: true));

    final result = await injector<GetAllFacilityUseCase>()(GetAllFacilityParams(page: _currentPage));
    result.fold(
      (error) {
        emit(state.copyWith(isLoading: false));
      },
      (data) {
        _currentPage++;
        emit(state.copyWith(
          data: [...state.data, ...data.findAll.facilities],
          currentPage: _currentPage,
          isLoading: false,
          hasReachedEnd: data.findAll.facilities.isEmpty,
        ));
      },
    );
  }
}

