import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sport_app/data/models/user/user_data.dart';
import 'package:sport_app/data/models/user/user_response.dart';

part 'user_response_model.freezed.dart';

part 'user_response_model.g.dart';

@freezed
class UserResponseModel with _$UserResponseModel {
  const factory UserResponseModel({
    UserResponse? login,
    UserResponse? register,
    UserData? getProfile,
  }) = _UserResponseModel;

  factory UserResponseModel.fromJson(Map<String, dynamic> json) => _$UserResponseModelFromJson(json);
}
