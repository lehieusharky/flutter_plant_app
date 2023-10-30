// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plant_special_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlantSpecialItem _$PlantSpecialItemFromJson(Map<String, dynamic> json) =>
    PlantSpecialItem(
      id: json['id'] as int?,
      commonName: json['common_name'] as String?,
      scientificName: (json['scientific_name'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      otherName: (json['other_name'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      cycle: json['cycle'] as String?,
      watering: json['watering'] as String?,
      sunlight: (json['sunlight'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      defaultImage: json['default_image'] == null
          ? null
          : DefaultImage.fromJson(
              json['default_image'] as Map<String, dynamic>),
    );

const _$PlantSpecialItemFieldMap = <String, String>{
  'id': 'id',
  'commonName': 'common_name',
  'scientificName': 'scientific_name',
  'otherName': 'other_name',
  'cycle': 'cycle',
  'watering': 'watering',
  'sunlight': 'sunlight',
  'defaultImage': 'default_image',
};

Map<String, dynamic> _$PlantSpecialItemToJson(PlantSpecialItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'common_name': instance.commonName,
      'scientific_name': instance.scientificName,
      'other_name': instance.otherName,
      'cycle': instance.cycle,
      'watering': instance.watering,
      'sunlight': instance.sunlight,
      'default_image': instance.defaultImage,
    };

DefaultImage _$DefaultImageFromJson(Map<String, dynamic> json) => DefaultImage(
      license: json['license'] as int?,
      licenseName: json['license_name'] as String?,
      licenseUrl: json['license_url'] as String?,
      originalUrl: json['original_url'] as String?,
      regularUrl: json['regular_url'] as String?,
    );

Map<String, dynamic> _$DefaultImageToJson(DefaultImage instance) =>
    <String, dynamic>{
      'license': instance.license,
      'license_name': instance.licenseName,
      'license_url': instance.licenseUrl,
      'original_url': instance.originalUrl,
      'regular_url': instance.regularUrl,
    };
