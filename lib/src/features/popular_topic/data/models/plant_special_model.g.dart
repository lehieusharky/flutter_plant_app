// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plant_special_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlantSpecialModel _$PlantSpecialModelFromJson(Map<String, dynamic> json) =>
    PlantSpecialModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => PlantSpecialItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: json['total'] as int?,
    );

Map<String, dynamic> _$PlantSpecialModelToJson(PlantSpecialModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'total': instance.total,
    };
