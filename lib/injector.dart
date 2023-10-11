import 'package:get_it/get_it.dart';
import 'package:sport_app/core/api/app_api.dart';
import 'package:sport_app/core/api/graphql_config.dart';
import 'package:sport_app/core/router/router_config.dart';
import 'package:sport_app/data/repositories/auth_repository_impl.dart';
import 'package:sport_app/domain/repositories/auth_repository.dart';
import 'package:sport_app/domain/usecases/auth/sign_in_use_case.dart';

final injector = GetIt.instance;

void init() {
  // Use cases

  injector.registerLazySingleton(() => SignInUserUseCase(injector()));

  // Repositories
  injector.registerLazySingleton<AuthorizationRepository>(() => AuthorizationRepositoryImpl(injector()));

  // API

  injector.registerLazySingleton(() => SportAppApi().clientToQuery());
  injector.registerLazySingleton(() => GraphClient(injector()));

  // App router
  injector.registerFactory(() => AppRouter());

  // Storage
  // injector.registerLazySingleton(() => TokenStorage());

  // Global state
  // injector.registerLazySingleton(() => UserCubit());
  // injector.registerLazySingleton(() => SignUpCubit());
}
