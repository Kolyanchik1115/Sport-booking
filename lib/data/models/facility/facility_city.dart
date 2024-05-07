
import 'package:freezed_annotation/freezed_annotation.dart';

part 'facility_city.freezed.dart';
part 'facility_city.g.dart';

@freezed
class FacilityCity with _$FacilityCity {
  const factory FacilityCity({
    required int id,
    required String? name,
  }) = _FacilityCity;

  factory FacilityCity.fromJson(Map<String, dynamic> json) => _$FacilityCityFromJson(json);
}