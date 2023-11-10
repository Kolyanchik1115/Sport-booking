// class ProfileCubit extends Cubit<ProfileState> {
//   ProfileCubit() : super(const ProfileState());
//
//   Future<void> updateUser() async {
//     final data = await injector<GetCurrentUserUseCase>()(NoParams());
//
//     data.fold(
//           (error) => null,
//           (user) => emit(state.copyWith(user: user)),
//     );
//   }
//
//   void setUser(UserData user) {
//     emit(state.copyWith(user: user));
//     updateUser();
//   }
//
//   void logout() {
//     injector<TokenStorage>().removeTokens();
//     injector<SportAppApi>().token = '';
//     injector<SportAppApi>().refreshToken = '';
//     injector<AppRouter>().go(AppRoutes.singIn);
//   }
// }
