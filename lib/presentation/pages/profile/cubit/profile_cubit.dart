
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sport_app/core/usecases/usecases.dart';
import 'package:sport_app/data/models/user/user_data.dart';
import 'package:sport_app/domain/usecases/user/get_current_user_use_case.dart';
import 'package:sport_app/injector.dart';

part 'profile_cubit.freezed.dart';
part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(const ProfileState());

  Future<void> updateUser() async {
    final data = await injector<GetCurrentUserUseCase>()(NoParams());

    data.fold(
      (error) => null,
      (user) => emit(state.copyWith(user: user)),
    );
  }

  void setUser(UserData user) {
    emit(state.copyWith(user: user));
    updateUser();
  }
}
