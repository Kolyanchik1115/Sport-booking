import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sport_app/core/api/sport_app_api.dart';
import 'package:sport_app/core/router/router_config.dart';
import 'package:sport_app/core/router/routes.dart';
import 'package:sport_app/data/models/user/user_data.dart';
import 'package:sport_app/domain/usecases/user/update_user_use_case.dart';
import 'package:sport_app/injector.dart';
import 'package:sport_app/presentation/pages/additions_pages/user/user_cubit.dart';

part 'editing_profile_cubit.freezed.dart';
part 'editing_profile_state.dart';

class EditingProfileCubit extends Cubit<EditingProfileState> {
  EditingProfileCubit() : super(const EditingProfileState());

  void setUser(UserData user) {
    emit(state.copyWith(user: user));
  }

  Future<bool> saveData({
    required UserData user,
    File? avatar,
  }) async {
    emit(state.copyWith(isLoading: true));

    final data = await injector<UpdateUserUseCase>()(UpdateUserParams(
      fullname: user.fullname,
      avatar: avatar,
      dateOfBirth: user.dateOfBirth,
    ));

    data.fold((onError) {
      emit(state.copyWith(isLoading: false, successMessage: null));
      return false;
    }, (user) {
      emit(state.copyWith(user: user, successMessage: 'Data has changed successfully'));
      injector<UserCubit>().setUser(user);
      injector<AppRouter>().go(AppRoutes.mainProfile);
    });

    emit(state.copyWith(isLoading: false, successMessage: null));
    return true;
  }
}
