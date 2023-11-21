part of 'profile_cubit.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState({
    UserData? user,
    @Default(false) bool isLoading,
    String? errorMessage,
  }) = _ProfileState;
}


// abstract class UserProfileState extends Equatable {
//   const UserProfileState();
//
//   @override
//   List<Object?> get props => [];
// }
//
// class UserProfileEmptyState extends UserProfileState {}
//
// class UserProfileLoadingState extends UserProfileState {}
//
// class UserProfileErrorState extends UserProfileState {
//   final String errorMessage;
//
//   @override
//   List<Object> get props => [errorMessage];
//
//   const UserProfileErrorState({
//     required this.errorMessage,
//   });
// }
//
// class UserProfileDataState extends UserProfileState {
//   final UserData user;
//
//   @override
//   List<Object> get props => [user];
//
//   const UserProfileDataState({
//     required this.user,
//   });
// }
