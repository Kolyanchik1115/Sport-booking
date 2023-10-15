import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sport_app/data/models/user/user_data.dart';

part 'user_response.freezed.dart';
part 'user_response.g.dart';


@freezed
class UserResponse with _$UserResponse {
  const factory UserResponse({
    required UserData user,
  }) = _UserResponse;

  factory UserResponse.fromJson(Map<String, dynamic> json) => _$UserResponseFromJson(json);
}
