
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sport_app/data/models/facility/facility_data_image.dart';
import 'package:sport_app/data/models/facility/facility_district.dart';

part 'facility_data.freezed.dart';
part 'facility_data.g.dart';

@freezed
class FacilityData with _$FacilityData {
  const factory FacilityData({
    required int id,
    required String name,
    required String? address,
    required List<String>? sportType,
    required String? coveringType,
    required FacilityDistrict? district,
    required int? minBookingTime,
    required String? facilityType,
    required String? description,
    required double? avgPrice,
    required String? location,
    required List<FacilityDataImage> images,
  }) = _FacilityData;

  factory FacilityData.fromJson(Map<String, dynamic> json) => _$FacilityDataFromJson(json);
}
