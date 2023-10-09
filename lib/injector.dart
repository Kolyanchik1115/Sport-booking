
import 'package:get_it/get_it.dart';
import 'package:sport_app/core/router/router_config.dart';

final injector = GetIt.instance;

void init() {
  // Use cases

  // injector.registerLazySingleton(() => SetUserFcmToken(injector(), injector()));

  // Repositories
  // injector.registerLazySingleton<AuthorizationRepository>(() => AuthorizationRepositoryImpl(injector()));

  // API
  // injector.registerLazySingleton(() => ISabiApi());
  // injector.registerLazySingleton(() => RestClient(injector<ISabiApi>().dio));

  // App router
  injector.registerFactory(() => AppRouter());

  // Storage
  // injector.registerLazySingleton(() => TokenStorage());

  // Global state
  // injector.registerLazySingleton(() => UserCubit());
  // injector.registerLazySingleton(() => SignUpCubit());
}
