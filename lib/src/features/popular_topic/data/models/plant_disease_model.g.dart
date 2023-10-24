// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plant_disease_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlantDiseaseModel _$PlantDiseaseModelFromJson(Map<String, dynamic> json) =>
    PlantDiseaseModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: json['total'] as int?,
    );

Map<String, dynamic> _$PlantDiseaseModelToJson(PlantDiseaseModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'total': instance.total,
    };
