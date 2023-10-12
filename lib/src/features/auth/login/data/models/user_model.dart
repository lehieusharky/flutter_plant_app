import 'package:plant_market/src/features/auth/login/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.userName,
    required super.email,
    required super.createAt,
    required super.id,
    required super.role,
  });
}
