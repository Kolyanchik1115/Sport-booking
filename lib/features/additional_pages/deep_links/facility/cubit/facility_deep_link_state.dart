part of 'facility_deep_link_cubit.dart';

@freezed
class FacilityDeepLinkState with _$FacilityDeepLinkState {
  const factory FacilityDeepLinkState.initial() = _Loading;
  const factory FacilityDeepLinkState.error({required String message}) = _Error;

}
