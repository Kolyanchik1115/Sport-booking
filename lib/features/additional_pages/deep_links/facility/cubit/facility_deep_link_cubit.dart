import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sport_app/core/router/router_config.dart';
import 'package:sport_app/core/router/routes.dart';
import 'package:sport_app/domain/usecases/facility/get_all_facility.dart';
import 'package:sport_app/injector.dart';

part 'facility_deep_link_cubit.freezed.dart';
part 'facility_deep_link_state.dart';

class FacilityDeepLinkCubit extends Cubit<FacilityDeepLinkState> {
  FacilityDeepLinkCubit() : super(const FacilityDeepLinkState.initial());

  Future<void> init(int id) async {
    emit(const FacilityDeepLinkState.initial());

    int currentPage = 1;
    bool facilityFound = false;
    try {
      while (!facilityFound) {
        final facilitiesResult = await injector<GetAllFacilityUseCase>()(GetAllFacilityParams(page: currentPage));

        facilitiesResult.fold(
          (failure) => emit(const FacilityDeepLinkState.error(message: 'Failed to fetch facilities')),
          (facilities) {
            final facility = facilities.findAll?.facilities.firstWhere((facility) => facility.id == id);

            if (facility != null) {
              injector<AppRouter>().go(AppRoutes.facilityDetails, extra: facility);
              facilityFound = true;
            } else if (facilities.findAll?.facilities.isEmpty ?? true) {
              emit(const FacilityDeepLinkState.error(message: 'Facility not found'));
              facilityFound = true;
            } else {
              currentPage++;
            }
          },
        );
        if (facilityFound) break;
      }
    } catch (e) {
      debugPrint(e.toString());
      injector<AppRouter>().go(AppRoutes.search);
    }
  }
}
