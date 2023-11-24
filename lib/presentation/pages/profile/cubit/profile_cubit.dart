import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sport_app/core/api/sport_app_api.dart';
import 'package:sport_app/core/error/failures.dart';
import 'package:sport_app/core/router/router_config.dart';
import 'package:sport_app/core/router/routes.dart';
import 'package:sport_app/core/storage/token_storage.dart';
import 'package:sport_app/core/usecases/usecases.dart';
import 'package:sport_app/data/models/user/user_data.dart';
import 'package:sport_app/domain/usecases/user/get_current_user_use_case.dart';
import 'package:sport_app/injector.dart';

part 'profile_state.dart';

part 'profile_cubit.freezed.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(const ProfileState());

  Future<void> getProfile() async {
    emit(state.copyWith(isLoading: true));

    final data = await injector<GetCurrentUserUseCase>()(NoParams());

    data.fold(
      (error) => emit(state.copyWith(errorMessage: error.runtimeType.toString(), isLoading: false)),
      (otherUser) => emit(state.copyWith(user: otherUser)),
    );
    emit(state.copyWith(isLoading: false));
  }

  void logout() {
    injector<TokenStorage>().removeTokens();
    injector<SportAppApi>().token = '';
    injector<SportAppApi>().refreshToken = '';
    injector<AppRouter>().go(AppRoutes.singIn);
  }
}
