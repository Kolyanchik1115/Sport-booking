import 'package:get_it/get_it.dart';
import 'package:sport_app/core/api/sport_app_api.dart';
import 'package:sport_app/core/api/grapgql_client.dart';
import 'package:sport_app/core/router/router_config.dart';
import 'package:sport_app/core/storage/token_storage.dart';
import 'package:sport_app/data/repositories/auth_repository_impl.dart';
import 'package:sport_app/data/repositories/user_repository_impl.dart';
import 'package:sport_app/domain/repositories/auth_repository.dart';
import 'package:sport_app/domain/repositories/user_repository.dart';
import 'package:sport_app/domain/usecases/auth/sign_in_use_case.dart';
import 'package:sport_app/domain/usecases/user/get_current_user_use_case.dart';

import 'presentation/pages/additions_pages/user/user_cubit.dart';

final injector = GetIt.instance;

void init() {
  // Use cases

  injector.registerLazySingleton(() => SignInUserUseCase(injector()));
  injector.registerLazySingleton(() => GetCurrentUserUseCase(injector()));


  // Repositories
  injector.registerLazySingleton<AuthorizationRepository>(() => AuthorizationRepositoryImpl(injector()));
  injector.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(injector()));


  // API

  injector.registerLazySingleton(() => SportAppApi());
  injector.registerLazySingleton(() => GraphClient(injector()));

  // App router
  injector.registerFactory(() => AppRouter());

  // Storage
  injector.registerLazySingleton(() => TokenStorage());

  // Global state
  injector.registerLazySingleton(() => UserCubit());
  // injector.registerLazySingleton(() => SignUpCubit());
}
