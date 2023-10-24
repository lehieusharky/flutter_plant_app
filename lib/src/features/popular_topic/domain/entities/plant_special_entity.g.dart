// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plant_special_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlantSpecialItem _$PlantSpecialItemFromJson(Map<String, dynamic> json) =>
    PlantSpecialItem(
      id: json['id'] as int?,
      commonName: json['commonName'] as String?,
      scientificName: (json['scientificName'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      otherName: (json['otherName'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      cycle: json['cycle'] as String?,
      watering: json['watering'] as String?,
      sunlight: (json['sunlight'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      defaultImage: json['defaultImage'] == null
          ? null
          : DefaultImage.fromJson(json['defaultImage'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PlantSpecialItemToJson(PlantSpecialItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'commonName': instance.commonName,
      'scientificName': instance.scientificName,
      'otherName': instance.otherName,
      'cycle': instance.cycle,
      'watering': instance.watering,
      'sunlight': instance.sunlight,
      'defaultImage': instance.defaultImage,
    };

DefaultImage _$DefaultImageFromJson(Map<String, dynamic> json) => DefaultImage(
      license: json['license'] as int?,
      licenseName: json['licenseName'] as String?,
      licenseUrl: json['licenseUrl'] as String?,
      originalUrl: json['originalUrl'] as String?,
      regularUrl: json['regularUrl'] as String?,
    );

Map<String, dynamic> _$DefaultImageToJson(DefaultImage instance) =>
    <String, dynamic>{
      'license': instance.license,
      'licenseName': instance.licenseName,
      'licenseUrl': instance.licenseUrl,
      'originalUrl': instance.originalUrl,
      'regularUrl': instance.regularUrl,
    };
