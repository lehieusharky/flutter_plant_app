// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plant_disease_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: json['id'] as int?,
      commonName: json['commonName'] as String?,
      scientificName: json['scientificName'] as String?,
      otherName: (json['otherName'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      description: (json['description'] as List<dynamic>?)
          ?.map((e) => Description.fromJson(e as Map<String, dynamic>))
          .toList(),
      solution: (json['solution'] as List<dynamic>?)
          ?.map((e) => Solution.fromJson(e as Map<String, dynamic>))
          .toList(),
      host: (json['host'] as List<dynamic>?)?.map((e) => e as String).toList(),
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => Images.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'commonName': instance.commonName,
      'scientificName': instance.scientificName,
      'otherName': instance.otherName,
      'description': instance.description,
      'solution': instance.solution,
      'host': instance.host,
      'images': instance.images,
    };

Description _$DescriptionFromJson(Map<String, dynamic> json) => Description(
      subtitle: json['subtitle'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$DescriptionToJson(Description instance) =>
    <String, dynamic>{
      'subtitle': instance.subtitle,
      'description': instance.description,
    };

Solution _$SolutionFromJson(Map<String, dynamic> json) => Solution(
      subtitle: json['subtitle'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$SolutionToJson(Solution instance) => <String, dynamic>{
      'subtitle': instance.subtitle,
      'description': instance.description,
    };

Images _$ImagesFromJson(Map<String, dynamic> json) => Images(
      license: json['license'] as int?,
      licenseName: json['licenseName'] as String?,
      originalUrl: json['originalUrl'] as String?,
      regularUrl: json['regularUrl'] as String?,
    );

Map<String, dynamic> _$ImagesToJson(Images instance) => <String, dynamic>{
      'license': instance.license,
      'licenseName': instance.licenseName,
      'originalUrl': instance.originalUrl,
      'regularUrl': instance.regularUrl,
    };
