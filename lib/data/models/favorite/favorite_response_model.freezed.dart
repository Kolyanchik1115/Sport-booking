// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favorite_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FavoriteResponseModel _$FavoriteResponseModelFromJson(
    Map<String, dynamic> json) {
  return _FavoriteFacilityResponseModel.fromJson(json);
}

/// @nodoc
mixin _$FavoriteResponseModel {
  bool? get addFavorite => throw _privateConstructorUsedError;
  bool? get removeFavorite => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FavoriteResponseModelCopyWith<FavoriteResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoriteResponseModelCopyWith<$Res> {
  factory $FavoriteResponseModelCopyWith(FavoriteResponseModel value,
          $Res Function(FavoriteResponseModel) then) =
      _$FavoriteResponseModelCopyWithImpl<$Res, FavoriteResponseModel>;
  @useResult
  $Res call({bool? addFavorite, bool? removeFavorite});
}

/// @nodoc
class _$FavoriteResponseModelCopyWithImpl<$Res,
        $Val extends FavoriteResponseModel>
    implements $FavoriteResponseModelCopyWith<$Res> {
  _$FavoriteResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? addFavorite = freezed,
    Object? removeFavorite = freezed,
  }) {
    return _then(_value.copyWith(
      addFavorite: freezed == addFavorite
          ? _value.addFavorite
          : addFavorite // ignore: cast_nullable_to_non_nullable
              as bool?,
      removeFavorite: freezed == removeFavorite
          ? _value.removeFavorite
          : removeFavorite // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FavoriteFacilityResponseModelImplCopyWith<$Res>
    implements $FavoriteResponseModelCopyWith<$Res> {
  factory _$$FavoriteFacilityResponseModelImplCopyWith(
          _$FavoriteFacilityResponseModelImpl value,
          $Res Function(_$FavoriteFacilityResponseModelImpl) then) =
      __$$FavoriteFacilityResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? addFavorite, bool? removeFavorite});
}

/// @nodoc
class __$$FavoriteFacilityResponseModelImplCopyWithImpl<$Res>
    extends _$FavoriteResponseModelCopyWithImpl<$Res,
        _$FavoriteFacilityResponseModelImpl>
    implements _$$FavoriteFacilityResponseModelImplCopyWith<$Res> {
  __$$FavoriteFacilityResponseModelImplCopyWithImpl(
      _$FavoriteFacilityResponseModelImpl _value,
      $Res Function(_$FavoriteFacilityResponseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? addFavorite = freezed,
    Object? removeFavorite = freezed,
  }) {
    return _then(_$FavoriteFacilityResponseModelImpl(
      addFavorite: freezed == addFavorite
          ? _value.addFavorite
          : addFavorite // ignore: cast_nullable_to_non_nullable
              as bool?,
      removeFavorite: freezed == removeFavorite
          ? _value.removeFavorite
          : removeFavorite // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FavoriteFacilityResponseModelImpl
    implements _FavoriteFacilityResponseModel {
  const _$FavoriteFacilityResponseModelImpl(
      {this.addFavorite, this.removeFavorite});

  factory _$FavoriteFacilityResponseModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$FavoriteFacilityResponseModelImplFromJson(json);

  @override
  final bool? addFavorite;
  @override
  final bool? removeFavorite;

  @override
  String toString() {
    return 'FavoriteResponseModel(addFavorite: $addFavorite, removeFavorite: $removeFavorite)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FavoriteFacilityResponseModelImpl &&
            (identical(other.addFavorite, addFavorite) ||
                other.addFavorite == addFavorite) &&
            (identical(other.removeFavorite, removeFavorite) ||
                other.removeFavorite == removeFavorite));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, addFavorite, removeFavorite);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FavoriteFacilityResponseModelImplCopyWith<
          _$FavoriteFacilityResponseModelImpl>
      get copyWith => __$$FavoriteFacilityResponseModelImplCopyWithImpl<
          _$FavoriteFacilityResponseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FavoriteFacilityResponseModelImplToJson(
      this,
    );
  }
}

abstract class _FavoriteFacilityResponseModel implements FavoriteResponseModel {
  const factory _FavoriteFacilityResponseModel(
      {final bool? addFavorite,
      final bool? removeFavorite}) = _$FavoriteFacilityResponseModelImpl;

  factory _FavoriteFacilityResponseModel.fromJson(Map<String, dynamic> json) =
      _$FavoriteFacilityResponseModelImpl.fromJson;

  @override
  bool? get addFavorite;
  @override
  bool? get removeFavorite;
  @override
  @JsonKey(ignore: true)
  _$$FavoriteFacilityResponseModelImplCopyWith<
          _$FavoriteFacilityResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
