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
  String? commonName;
  List<String>? scientificName;
  List<String>? otherName;
  String? cycle;
  String? watering;
  List<String>? sunlight;
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
  String? licenseName;
  String? licenseUrl;
  String? originalUrl;
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
