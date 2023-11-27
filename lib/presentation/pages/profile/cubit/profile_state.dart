part of 'profile_cubit.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState({
    UserData? user,
    @Default(false) bool isLoading,
    String? errorMessage,
  }) = _ProfileState;
}

