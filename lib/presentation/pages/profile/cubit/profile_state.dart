part of 'profile_cubit.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState({
    UserData? user,
  }) = _ProfileState;
}
