import 'package:freezed_annotation/freezed_annotation.dart';
part 'favorite_response_model.freezed.dart';
part 'favorite_response_model.g.dart';

@freezed
class FavoriteResponseModel with _$FavoriteResponseModel {
  const factory FavoriteResponseModel({
    bool? addFavorite,
    bool? removeFavorite,
  }) = _FavoriteFacilityResponseModel;

  factory FavoriteResponseModel.fromJson(Map<String, dynamic> json) => _$FavoriteResponseModelFromJson(json);
}

