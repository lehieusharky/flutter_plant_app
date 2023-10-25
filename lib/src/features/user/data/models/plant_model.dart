import 'package:json_annotation/json_annotation.dart';
import 'package:plant_market/src/features/user/data/models/timeline_model.dart';
import 'package:plant_market/src/features/user/domain/entities/plant_entity.dart';

part 'plant_model.g.dart';

@JsonSerializable()
class PlantModel extends PlantEntity {
  const PlantModel({
    required super.id,
    required super.name,
    required super.listTimeLine,
  });

  factory PlantModel.fromJson(Map<String, dynamic> json) =>
      _$PlantModelFromJson(json);

  Map<String, dynamic> toJson() => _$PlantModelToJson(this);
}
