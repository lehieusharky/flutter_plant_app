import 'package:equatable/equatable.dart';
import 'package:plant_market/src/core/data/defines/enum/role.dart';

class UserEntity extends Equatable {
  final String id;
  final String? userName;
  final String? email;
  final String createAt;
  final Role role;
  final List<String> listPostId;
  final List<String> listPlantName;
  final List<String> listFavoriteIDCommunityPost;
  final String selectedPlantName;

  const UserEntity({
    required this.id,
    this.role = Role.regular,
    required this.createAt,
    required this.listFavoriteIDCommunityPost,
    required this.selectedPlantName,
    this.userName,
    this.email,
    required this.listPostId,
    required this.listPlantName,
  });

  @override
  List<Object?> get props => [
        userName,
        email,
        createAt,
        role,
        id,
        listPostId,
        selectedPlantName,
        listPlantName,
        listFavoriteIDCommunityPost,
      ];
}
