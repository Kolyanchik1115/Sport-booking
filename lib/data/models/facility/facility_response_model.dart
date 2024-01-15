import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sport_app/data/models/facility/facility_response.dart';

part 'facility_response_model.freezed.dart';
part 'facility_response_model.g.dart';

@freezed
class FacilityResponseModel with _$FacilityResponseModel {
  const factory FacilityResponseModel({
    required FacilityResponse findAll,
  }) = _FacilityResponseModel;

  factory FacilityResponseModel.fromJson(Map<String, dynamic> json) => _$FacilityResponseModelFromJson(json);
}
