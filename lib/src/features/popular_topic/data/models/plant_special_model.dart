import 'package:json_annotation/json_annotation.dart';
import 'package:plant_market/src/features/popular_topic/domain/entities/plant_special_entity.dart';

part 'plant_special_model.g.dart';

@JsonSerializable()
class PlantSpecialModel extends PlantSpecialEntity {
  const PlantSpecialModel({
    super.data,
    super.total,
  });

  factory PlantSpecialModel.fromJson(Map<String, dynamic> json) =>
      _$PlantSpecialModelFromJson(json);

  Map<String, dynamic> toJson() => _$PlantSpecialModelToJson(this);
}
