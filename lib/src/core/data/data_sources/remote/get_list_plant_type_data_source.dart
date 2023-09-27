import 'package:equatable/equatable.dart';

class PlantType extends Equatable {
  final int? id;
  final String? commonName;
  final List<String>? scientificName;
  final String? cycle;
  final String? watering;
  final List<String>? sunlight;
  final DefaultImage? defaultImage;

  const PlantType({
    this.id,
    this.commonName,
    this.scientificName,
    this.cycle,
    this.watering,
    this.sunlight,
    this.defaultImage,
  });

  @override
  List<Object?> get props => [
        id,
        commonName,
        scientificName,
        cycle,
        watering,
        sunlight,
        defaultImage,
      ];
}

class DefaultImage {
  int? license;
  String? licenseName;
  String? licenseUrl;
  String? originalUrl;
  String? regularUrl;
  String? mediumUrl;
  String? smallUrl;
  String? thumbnail;

  DefaultImage({
    this.license,
    this.licenseName,
    this.licenseUrl,
    this.originalUrl,
    this.regularUrl,
    this.mediumUrl,
    this.smallUrl,
    this.thumbnail,
  });
}
