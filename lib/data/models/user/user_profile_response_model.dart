import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sport_app/data/models/user/user_data.dart';
import 'package:sport_app/data/models/user/user_response.dart';

part 'user_profile_response_model.freezed.dart';
part 'user_profile_response_model.g.dart';

@freezed
class UserProfileResponseModel with _$UserProfileResponseModel {
  const factory UserProfileResponseModel({
    required UserData getProfile,
  }) = _UserProfileResponseModel;

  factory UserProfileResponseModel.fromJson(Map<String, dynamic> json) => _$UserProfileResponseModelFromJson(json);
}
