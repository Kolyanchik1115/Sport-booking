part of 'email_confirmation_deep_link_cubit.dart';

@freezed
class EmailConfirmationDeepLinkState with _$EmailConfirmationDeepLinkState {
  const factory EmailConfirmationDeepLinkState.initial() = _Initial;
  const factory EmailConfirmationDeepLinkState.loading() = _Loading;
  const factory EmailConfirmationDeepLinkState.info() =  _Info;
  const factory EmailConfirmationDeepLinkState.error() =  _Error;
}
