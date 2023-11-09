import 'package:json_annotation/json_annotation.dart';
import 'package:plant_market/src/core/data/defines/enum/role.dart';
import 'package:plant_market/src/core/domain/entities/user_entity.dart';
import 'package:plant_market/src/features/home/data/models/community_post_model.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends UserEntity {
  const UserModel({
    required super.userName,
    required super.email,
    required super.createAt,
    required super.id,
    required super.role,
    required super.listPostId,
    required super.listPlantName,
    required super.listFavoriteCommunityPost,
    required super.selectedPlantName,
    required super.listFavoriteIDCommunityPost,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
