import 'package:equatable/equatable.dart';
import 'package:plant_market/src/core/data/defines/enum/role.dart';

class UserEntity extends Equatable {
  final String _id;
  final String? userName;
  final String? email;
  final String createAt;
  Role role;

  UserEntity({
    required String id,
    this.role = Role.regular,
    required this.createAt,
    this.userName,
    this.email,
  }) : _id = id;

  String get getId => _id;

  @override
  List<Object?> get props => [userName, email, createAt, role, getId];
}
