part of 'social_auth_cubit.dart';

@freezed
class SocialAuthState with _$SocialAuthState {
  const factory SocialAuthState({
    @Default('') String message,
  }) = _SocialAuthState;
}
