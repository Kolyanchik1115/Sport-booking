import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sport_app/data/models/facility/facility_data.dart';
import 'package:sport_app/data/models/user/user_data.dart';

part 'facility_response.freezed.dart';

part 'facility_response.g.dart';

@freezed
class FacilityResponse with _$FacilityResponse {
  const factory FacilityResponse({
    required List<FacilityData> facilities,
  }) = _FacilityResponse;

  factory FacilityResponse.fromJson(Map<String, dynamic> json) => _$FacilityResponseFromJson(json);
}
