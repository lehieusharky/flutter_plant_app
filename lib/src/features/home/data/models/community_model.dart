import 'package:json_annotation/json_annotation.dart';
import 'package:plant_market/src/features/home/domain/entities/community_entity.dart';

part 'community_model.g.dart';

@JsonSerializable()
class CommunityModel extends CommunityEntity {
  const CommunityModel({super.number});

  factory CommunityModel.fromJson(Map<String, dynamic> json) =>
      _$CommunityModelFromJson(json);

  Map<String, dynamic> toJson() => _$CommunityModelToJson(this);
}
