// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'facility_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FacilityData _$FacilityDataFromJson(Map<String, dynamic> json) {
  return _FacilityData.fromJson(json);
}

/// @nodoc
mixin _$FacilityData {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  List<String>? get sportType => throw _privateConstructorUsedError;
  String? get coveringType => throw _privateConstructorUsedError;
  FacilityDistrict? get district => throw _privateConstructorUsedError;
  int? get minBookingTime => throw _privateConstructorUsedError;
  String? get facilityType => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  double? get avgPrice => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;
  bool get isWorking => throw _privateConstructorUsedError;
  bool get currentUserIsFavorite => throw _privateConstructorUsedError;
  List<FacilityDataImage> get images => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FacilityDataCopyWith<FacilityData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FacilityDataCopyWith<$Res> {
  factory $FacilityDataCopyWith(
          FacilityData value, $Res Function(FacilityData) then) =
      _$FacilityDataCopyWithImpl<$Res, FacilityData>;
  @useResult
  $Res call(
      {int id,
      String name,
      String? address,
      List<String>? sportType,
      String? coveringType,
      FacilityDistrict? district,
      int? minBookingTime,
      String? facilityType,
      String? description,
      double? avgPrice,
      String? location,
      bool isWorking,
      bool currentUserIsFavorite,
      List<FacilityDataImage> images});

  $FacilityDistrictCopyWith<$Res>? get district;
}

/// @nodoc
class _$FacilityDataCopyWithImpl<$Res, $Val extends FacilityData>
    implements $FacilityDataCopyWith<$Res> {
  _$FacilityDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? address = freezed,
    Object? sportType = freezed,
    Object? coveringType = freezed,
    Object? district = freezed,
    Object? minBookingTime = freezed,
    Object? facilityType = freezed,
    Object? description = freezed,
    Object? avgPrice = freezed,
    Object? location = freezed,
    Object? isWorking = null,
    Object? currentUserIsFavorite = null,
    Object? images = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      sportType: freezed == sportType
          ? _value.sportType
          : sportType // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      coveringType: freezed == coveringType
          ? _value.coveringType
          : coveringType // ignore: cast_nullable_to_non_nullable
              as String?,
      district: freezed == district
          ? _value.district
          : district // ignore: cast_nullable_to_non_nullable
              as FacilityDistrict?,
      minBookingTime: freezed == minBookingTime
          ? _value.minBookingTime
          : minBookingTime // ignore: cast_nullable_to_non_nullable
              as int?,
      facilityType: freezed == facilityType
          ? _value.facilityType
          : facilityType // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      avgPrice: freezed == avgPrice
          ? _value.avgPrice
          : avgPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      isWorking: null == isWorking
          ? _value.isWorking
          : isWorking // ignore: cast_nullable_to_non_nullable
              as bool,
      currentUserIsFavorite: null == currentUserIsFavorite
          ? _value.currentUserIsFavorite
          : currentUserIsFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<FacilityDataImage>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FacilityDistrictCopyWith<$Res>? get district {
    if (_value.district == null) {
      return null;
    }

    return $FacilityDistrictCopyWith<$Res>(_value.district!, (value) {
      return _then(_value.copyWith(district: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FacilityDataImplCopyWith<$Res>
    implements $FacilityDataCopyWith<$Res> {
  factory _$$FacilityDataImplCopyWith(
          _$FacilityDataImpl value, $Res Function(_$FacilityDataImpl) then) =
      __$$FacilityDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String? address,
      List<String>? sportType,
      String? coveringType,
      FacilityDistrict? district,
      int? minBookingTime,
      String? facilityType,
      String? description,
      double? avgPrice,
      String? location,
      bool isWorking,
      bool currentUserIsFavorite,
      List<FacilityDataImage> images});

  @override
  $FacilityDistrictCopyWith<$Res>? get district;
}

/// @nodoc
class __$$FacilityDataImplCopyWithImpl<$Res>
    extends _$FacilityDataCopyWithImpl<$Res, _$FacilityDataImpl>
    implements _$$FacilityDataImplCopyWith<$Res> {
  __$$FacilityDataImplCopyWithImpl(
      _$FacilityDataImpl _value, $Res Function(_$FacilityDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? address = freezed,
    Object? sportType = freezed,
    Object? coveringType = freezed,
    Object? district = freezed,
    Object? minBookingTime = freezed,
    Object? facilityType = freezed,
    Object? description = freezed,
    Object? avgPrice = freezed,
    Object? location = freezed,
    Object? isWorking = null,
    Object? currentUserIsFavorite = null,
    Object? images = null,
  }) {
    return _then(_$FacilityDataImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      sportType: freezed == sportType
          ? _value._sportType
          : sportType // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      coveringType: freezed == coveringType
          ? _value.coveringType
          : coveringType // ignore: cast_nullable_to_non_nullable
              as String?,
      district: freezed == district
          ? _value.district
          : district // ignore: cast_nullable_to_non_nullable
              as FacilityDistrict?,
      minBookingTime: freezed == minBookingTime
          ? _value.minBookingTime
          : minBookingTime // ignore: cast_nullable_to_non_nullable
              as int?,
      facilityType: freezed == facilityType
          ? _value.facilityType
          : facilityType // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      avgPrice: freezed == avgPrice
          ? _value.avgPrice
          : avgPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      isWorking: null == isWorking
          ? _value.isWorking
          : isWorking // ignore: cast_nullable_to_non_nullable
              as bool,
      currentUserIsFavorite: null == currentUserIsFavorite
          ? _value.currentUserIsFavorite
          : currentUserIsFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<FacilityDataImage>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FacilityDataImpl implements _FacilityData {
  const _$FacilityDataImpl(
      {required this.id,
      required this.name,
      required this.address,
      required final List<String>? sportType,
      required this.coveringType,
      required this.district,
      required this.minBookingTime,
      required this.facilityType,
      required this.description,
      required this.avgPrice,
      required this.location,
      required this.isWorking,
      required this.currentUserIsFavorite,
      required final List<FacilityDataImage> images})
      : _sportType = sportType,
        _images = images;

  factory _$FacilityDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$FacilityDataImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String? address;
  final List<String>? _sportType;
  @override
  List<String>? get sportType {
    final value = _sportType;
    if (value == null) return null;
    if (_sportType is EqualUnmodifiableListView) return _sportType;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? coveringType;
  @override
  final FacilityDistrict? district;
  @override
  final int? minBookingTime;
  @override
  final String? facilityType;
  @override
  final String? description;
  @override
  final double? avgPrice;
  @override
  final String? location;
  @override
  final bool isWorking;
  @override
  final bool currentUserIsFavorite;
  final List<FacilityDataImage> _images;
  @override
  List<FacilityDataImage> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  String toString() {
    return 'FacilityData(id: $id, name: $name, address: $address, sportType: $sportType, coveringType: $coveringType, district: $district, minBookingTime: $minBookingTime, facilityType: $facilityType, description: $description, avgPrice: $avgPrice, location: $location, isWorking: $isWorking, currentUserIsFavorite: $currentUserIsFavorite, images: $images)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FacilityDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.address, address) || other.address == address) &&
            const DeepCollectionEquality()
                .equals(other._sportType, _sportType) &&
            (identical(other.coveringType, coveringType) ||
                other.coveringType == coveringType) &&
            (identical(other.district, district) ||
                other.district == district) &&
            (identical(other.minBookingTime, minBookingTime) ||
                other.minBookingTime == minBookingTime) &&
            (identical(other.facilityType, facilityType) ||
                other.facilityType == facilityType) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.avgPrice, avgPrice) ||
                other.avgPrice == avgPrice) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.isWorking, isWorking) ||
                other.isWorking == isWorking) &&
            (identical(other.currentUserIsFavorite, currentUserIsFavorite) ||
                other.currentUserIsFavorite == currentUserIsFavorite) &&
            const DeepCollectionEquality().equals(other._images, _images));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      address,
      const DeepCollectionEquality().hash(_sportType),
      coveringType,
      district,
      minBookingTime,
      facilityType,
      description,
      avgPrice,
      location,
      isWorking,
      currentUserIsFavorite,
      const DeepCollectionEquality().hash(_images));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FacilityDataImplCopyWith<_$FacilityDataImpl> get copyWith =>
      __$$FacilityDataImplCopyWithImpl<_$FacilityDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FacilityDataImplToJson(
      this,
    );
  }
}

abstract class _FacilityData implements FacilityData {
  const factory _FacilityData(
      {required final int id,
      required final String name,
      required final String? address,
      required final List<String>? sportType,
      required final String? coveringType,
      required final FacilityDistrict? district,
      required final int? minBookingTime,
      required final String? facilityType,
      required final String? description,
      required final double? avgPrice,
      required final String? location,
      required final bool isWorking,
      required final bool currentUserIsFavorite,
      required final List<FacilityDataImage> images}) = _$FacilityDataImpl;

  factory _FacilityData.fromJson(Map<String, dynamic> json) =
      _$FacilityDataImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String? get address;
  @override
  List<String>? get sportType;
  @override
  String? get coveringType;
  @override
  FacilityDistrict? get district;
  @override
  int? get minBookingTime;
  @override
  String? get facilityType;
  @override
  String? get description;
  @override
  double? get avgPrice;
  @override
  String? get location;
  @override
  bool get isWorking;
  @override
  bool get currentUserIsFavorite;
  @override
  List<FacilityDataImage> get images;
  @override
  @JsonKey(ignore: true)
  _$$FacilityDataImplCopyWith<_$FacilityDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
