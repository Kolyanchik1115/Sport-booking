import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:sport_app/core/router/routes.dart';
import 'package:sport_app/data/models/facility/facility_data.dart';
import 'package:sport_app/presentation/pages/booking/cubit/booking_cubit.dart';
import 'package:sport_app/presentation/pages/edit_profile/edit_profile_page.dart';
import 'package:sport_app/presentation/pages/booking/facility_booking_page.dart';
import 'package:sport_app/presentation/pages/booking/facility_details_page.dart';
import 'package:sport_app/presentation/pages/favorite/favorite_page.dart';
import 'package:sport_app/presentation/pages/profile/cubit/profile_cubit.dart';
import 'package:sport_app/presentation/pages/profile/profile_page.dart';
import 'package:sport_app/presentation/pages/reservation/reservation_page.dart';
import 'package:sport_app/presentation/pages/search/search_page.dart';
import 'package:sport_app/presentation/pages/sign_in/sign_in_page.dart';
import 'package:sport_app/presentation/pages/sign_up/sign_up_page.dart';
import 'package:sport_app/presentation/pages/splash/splash_page.dart';
import 'package:sport_app/presentation/widgets/scaffold_with_nav_bar.dart';

import '../../presentation/pages/booking/facility_confirm_booking_page.dart';

class AppRouter {
  static final AppRouter _appRouter = AppRouter._();

  late final GlobalKey<NavigatorState> _rootNavigatorKey;
  late final GoRouter _config;

  factory AppRouter() {
    return _appRouter;
  }

  AppRouter._() {
    _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

    _config = GoRouter(
      navigatorKey: _rootNavigatorKey,
      initialLocation: AppRoutes.splashPage,
      routes: [
        GoRoute(
          path: AppRoutes.splashPage,
          builder: (BuildContext context, GoRouterState state) => const SplashPage(),
        ),
        GoRoute(
          path: AppRoutes.signUp,
          pageBuilder: (BuildContext context, GoRouterState state) => _customTransitionPage(
            state,
            Duration.zero,
            const SignUpPage(),
          ),
        ),
        GoRoute(
          path: AppRoutes.signIn,
          pageBuilder: (BuildContext context, GoRouterState state) => _customTransitionPage(
            state,
            Duration.zero,
            const SignInPage(),
          ),
        ),
        GoRoute(
          path: AppRoutes.editProfile,
          builder: (BuildContext context, GoRouterState state) => EditingProfilePage(
            profileCubit: state.extra as ProfileCubit,
          ),
        ),

        GoRoute(
          path: AppRoutes.facilityBooking,
          builder: (BuildContext context, GoRouterState state) => FacilityBookingPage(
            facilityId: (state.extra as List<dynamic>)[0] as int,
            bookingCubit: (state.extra as List<dynamic>)[1] as BookingCubit,
          ),
        ),
        GoRoute(
          path: AppRoutes.facilityDetails,
          builder: (BuildContext context, GoRouterState state) => FacilityDetailsPage(
            facilityData: state.extra as FacilityData,
          ),
        ),
        GoRoute(
          path: AppRoutes.editProfile,
          builder: (BuildContext context, GoRouterState state) => EditingProfilePage(
            profileCubit: state.extra as ProfileCubit,
          ),
        ),
        GoRoute(
          path: AppRoutes.confirmBooking,
          builder: (BuildContext context, GoRouterState state) => FacilityConfirmBookingPage(
            price: state.extra as double,
          ),
        ),
        StatefulShellRoute.indexedStack(
          builder: (BuildContext context, GoRouterState state, StatefulNavigationShell navigationShell) {
            return ScaffoldWithNavBar(navigationShell: navigationShell);
          },
          branches: [
            StatefulShellBranch(
              routes: <RouteBase>[
                GoRoute(
                  path: AppRoutes.search,
                  builder: (BuildContext context, GoRouterState state) => const SearchPage(),
                ),
              ],
            ),
            StatefulShellBranch(
              routes: <RouteBase>[
                GoRoute(
                  path: AppRoutes.favorites,
                  builder: (BuildContext context, GoRouterState state) => const FavoritePage(),
                ),
              ],
            ),
            StatefulShellBranch(
              routes: <RouteBase>[
                GoRoute(
                  path: AppRoutes.reservation,
                  builder: (BuildContext context, GoRouterState state) => const ReservationPage(),
                ),
              ],
            ),
            StatefulShellBranch(
              routes: <RouteBase>[
                GoRoute(
                  path: AppRoutes.mainProfile,
                  builder: (BuildContext context, GoRouterState state) => const ProfilePage(),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  GoRouter get config {
    return _config;
  }

  void go(String location, {Object? extra}) {
    _config.go(location, extra: extra);
  }

  void goNamed(String location) {
    _config.goNamed(location);
  }

  CustomTransitionPage _customTransitionPage(GoRouterState state, Duration duration, Widget child) {
    return CustomTransitionPage<void>(
      key: state.pageKey,
      child: child,
      transitionDuration: duration,
      transitionsBuilder:
          (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
        return FadeTransition(
          opacity: CurveTween(curve: Curves.easeInOut).animate(animation),
          child: child,
        );
      },
    );
  }
}
