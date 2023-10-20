import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_data.freezed.dart';

part 'user_data.g.dart';

@freezed
class UserData with _$UserData {
  const factory UserData({
    required int? id,
    required String? email,
    required String? fullname,
    required bool? isActivated,
    DateTime? dateOfBirth,
  }) = _UserData;

  factory UserData.fromJson(Map<String, dynamic> json) => _$UserDataFromJson(json);
}
