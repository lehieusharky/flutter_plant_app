import 'package:json_annotation/json_annotation.dart';
import 'package:plant_market/src/core/data/defines/enum/role.dart';
import 'package:plant_market/src/core/domain/entities/user_entity.dart';

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
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
