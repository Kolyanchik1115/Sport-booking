
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sport_app/data/models/facility/facility_city.dart';

part 'facility_district.freezed.dart';
part 'facility_district.g.dart';

@freezed
class FacilityDistrict with _$FacilityDistrict {
  const factory FacilityDistrict({
    required FacilityCity? city,
    required int id,
    required String? name,
  }) = _FacilityDistrict;
  factory FacilityDistrict.fromJson(Map<String, dynamic> json) => _$FacilityDistrictFromJson(json);
}