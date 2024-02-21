// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'facility_data_image.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FacilityDataImage _$FacilityDataImageFromJson(Map<String, dynamic> json) {
  return _FacilityDataImage.fromJson(json);
}

/// @nodoc
mixin _$FacilityDataImage {
  String get image => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FacilityDataImageCopyWith<FacilityDataImage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FacilityDataImageCopyWith<$Res> {
  factory $FacilityDataImageCopyWith(
          FacilityDataImage value, $Res Function(FacilityDataImage) then) =
      _$FacilityDataImageCopyWithImpl<$Res, FacilityDataImage>;
  @useResult
  $Res call({String image});
}

/// @nodoc
class _$FacilityDataImageCopyWithImpl<$Res, $Val extends FacilityDataImage>
    implements $FacilityDataImageCopyWith<$Res> {
  _$FacilityDataImageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = null,
  }) {
    return _then(_value.copyWith(
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FacilityDataImageImplCopyWith<$Res>
    implements $FacilityDataImageCopyWith<$Res> {
  factory _$$FacilityDataImageImplCopyWith(_$FacilityDataImageImpl value,
          $Res Function(_$FacilityDataImageImpl) then) =
      __$$FacilityDataImageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String image});
}

/// @nodoc
class __$$FacilityDataImageImplCopyWithImpl<$Res>
    extends _$FacilityDataImageCopyWithImpl<$Res, _$FacilityDataImageImpl>
    implements _$$FacilityDataImageImplCopyWith<$Res> {
  __$$FacilityDataImageImplCopyWithImpl(_$FacilityDataImageImpl _value,
      $Res Function(_$FacilityDataImageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = null,
  }) {
    return _then(_$FacilityDataImageImpl(
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FacilityDataImageImpl implements _FacilityDataImage {
  const _$FacilityDataImageImpl({required this.image});

  factory _$FacilityDataImageImpl.fromJson(Map<String, dynamic> json) =>
      _$$FacilityDataImageImplFromJson(json);

  @override
  final String image;

  @override
  String toString() {
    return 'FacilityDataImage(image: $image)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FacilityDataImageImpl &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, image);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FacilityDataImageImplCopyWith<_$FacilityDataImageImpl> get copyWith =>
      __$$FacilityDataImageImplCopyWithImpl<_$FacilityDataImageImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FacilityDataImageImplToJson(
      this,
    );
  }
}

abstract class _FacilityDataImage implements FacilityDataImage {
  const factory _FacilityDataImage({required final String image}) =
      _$FacilityDataImageImpl;

  factory _FacilityDataImage.fromJson(Map<String, dynamic> json) =
      _$FacilityDataImageImpl.fromJson;

  @override
  String get image;
  @override
  @JsonKey(ignore: true)
  _$$FacilityDataImageImplCopyWith<_$FacilityDataImageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
