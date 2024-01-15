
import 'package:freezed_annotation/freezed_annotation.dart';

part 'facility_data.freezed.dart';

part 'facility_data.g.dart';

@freezed
class FacilityData with _$FacilityData {
  const factory FacilityData({
    required int? id,
    required String? name,
    required String? address,
    required String? sportType,
    required String? coveringType,
    required String? facilityType,
    required String? description,
  }) = _FacilityData;

  factory FacilityData.fromJson(Map<String, dynamic> json) => _$FacilityDataFromJson(json);
}
