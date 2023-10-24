import 'package:json_annotation/json_annotation.dart';
import 'package:plant_market/src/features/popular_topic/domain/entities/plant_disease_entity.dart';

part 'plant_disease_model.g.dart';

@JsonSerializable()
class PlantDiseaseModel extends PlantDiseaseEntity {
  const PlantDiseaseModel({
    super.data,
    super.total,
  });

  factory PlantDiseaseModel.fromJson(Map<String, dynamic> json) =>
      _$PlantDiseaseModelFromJson(json);

  Map<String, dynamic> toJson() => _$PlantDiseaseModelToJson(this);
}
