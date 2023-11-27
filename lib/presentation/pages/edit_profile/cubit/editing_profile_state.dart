part of 'editing_profile_cubit.dart';

@freezed
class EditingProfileState with _$EditingProfileState {
  const factory EditingProfileState({
    String? nameError,
    String? successMessage,
    @Default(false) bool isLoading,
    UserData? user,
    String? avatar,
  }) = _ProfileState;
}
