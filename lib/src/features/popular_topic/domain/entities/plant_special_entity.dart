import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'plant_special_entity.g.dart';

class PlantSpecialEntity extends Equatable {
  final List<PlantSpecialItem>? data;
  final int? total;

  const PlantSpecialEntity({
    this.data,
    this.total,
  });

  @override
  List<Object?> get props => [data, total];
}

@JsonSerializable()
class PlantSpecialItem {
  int? id;
  @JsonKey(name: 'common_name')
  String? commonName;
  @JsonKey(name: 'scientific_name')
  List<String>? scientificName;
  @JsonKey(name: 'other_name')
  List<String>? otherName;
  String? cycle;
  String? watering;
  List<String>? sunlight;
  @JsonKey(name: 'default_image')
  DefaultImage? defaultImage;

  PlantSpecialItem({
    this.id,
    this.commonName,
    this.scientificName,
    this.otherName,
    this.cycle,
    this.watering,
    this.sunlight,
    this.defaultImage,
  });

  factory PlantSpecialItem.fromJson(Map<String, dynamic> json) =>
      _$PlantSpecialItemFromJson(json);

  Map<String, dynamic> toJson() => _$PlantSpecialItemToJson(this);
}

@JsonSerializable()
class DefaultImage {
  int? license;
  @JsonKey(name: 'license_name')
  String? licenseName;
  @JsonKey(name: 'license_url')
  String? licenseUrl;
  @JsonKey(name: 'original_url')
  String? originalUrl;
  @JsonKey(name: 'regular_url')
  String? regularUrl;

  DefaultImage({
    this.license,
    this.licenseName,
    this.licenseUrl,
    this.originalUrl,
    this.regularUrl,
  });

  factory DefaultImage.fromJson(Map<String, dynamic> json) =>
      _$DefaultImageFromJson(json);

  Map<String, dynamic> toJson() => _$DefaultImageToJson(this);
}
