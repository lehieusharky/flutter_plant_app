import 'package:json_annotation/json_annotation.dart';
import 'package:plant_market/src/features/home/domain/entities/community_post_entity.dart';

part 'community_post_model.g.dart';

@JsonSerializable()
class CommunityPostModel extends CommunityPostEntity {
  const CommunityPostModel({
    required super.title,
    required super.description,
    required super.tags,
    required super.image,
    required super.authorId,
  });

  factory CommunityPostModel.fromJson(Map<String, dynamic> json) =>
      _$CommunityPostModelFromJson(json);

  Map<String, dynamic> toJson() => _$CommunityPostModelToJson(this);
}
