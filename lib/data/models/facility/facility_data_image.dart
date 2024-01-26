import 'package:freezed_annotation/freezed_annotation.dart';
part 'facility_data_image.freezed.dart';
part 'facility_data_image.g.dart';

@freezed
class FacilityDataImage with _$FacilityDataImage {
  const factory FacilityDataImage({
    required String image,
  }) = _FacilityDataImage;

  factory FacilityDataImage.fromJson(Map<String, dynamic> json) => _$FacilityDataImageFromJson(json);
}
