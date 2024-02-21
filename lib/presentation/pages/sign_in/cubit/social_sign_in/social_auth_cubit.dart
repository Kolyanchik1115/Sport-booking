import 'dart:io';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sport_app/core/api/sport_app_api.dart';
import 'package:sport_app/core/router/router_config.dart';
import 'package:sport_app/core/router/routes.dart';
import 'package:sport_app/domain/usecases/auth/google_sign_in_use_case.dart';
import 'package:sport_app/injector.dart';
import 'package:sport_app/presentation/pages/additions_pages/user/user_cubit.dart';

part 'social_auth_state.dart';

part 'social_auth_cubit.freezed.dart';

class SocialAuthCubit extends Cubit<SocialAuthState> {
  SocialAuthCubit() : super(const SocialAuthState());

  Future<void> signInWithGoogle({bool isAgree = true}) async {
    const String androidClientId = kReleaseMode
        ? 'kk'
        : '953820261350-upko59qj8ai7sf25rovgmb1v6n4gk0e6.apps.googleusercontent.com';

    final String clientId = Platform.isAndroid
        ? androidClientId
        : '953820261350-hevutgciqeisj53ddct4f8eu6qc5t77o.apps.googleusercontent.com';

    try {
      final GoogleSignIn  googleSignIn = GoogleSignIn(
        clientId: clientId,
        scopes: [
          'https://www.googleapis.com/auth/userinfo.profile',
          'https://www.googleapis.com/auth/userinfo.email',
        ],
      );

      final acc = await googleSignIn.signIn();

      if (acc == null) {
        return;
      }

      final authentication = await acc.authentication;

      if (authentication.idToken == null || authentication.idToken!.isEmpty) {
        debugPrint('Authentication google token is empty or null');
        emit(state.copyWith(message: 'Something went wrong'));
      }

      final response = await injector<GoogleSignInUserUseCase>()(
        GoogleSignInParams(token: authentication.accessToken!),
      );

      response.fold(
        (onError) => emit(state.copyWith(message:'Something went wrong'),
        ),
        (token) async {
          injector<SportAppApi>().token = token.googleAuth?.accessToken;
          injector<SportAppApi>().refreshToken = token.googleAuth?.refreshToken;
          injector<UserCubit>().setUser(token.googleAuth!.user);
          injector<AppRouter>().go(AppRoutes.search);
        },
      );
    } catch (e) {
      debugPrint(e.toString());
      emit(state.copyWith(message:e.toString()));
    }
  }
}
