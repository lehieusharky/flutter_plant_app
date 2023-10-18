// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      userName: json['userName'] as String?,
      email: json['email'] as String?,
      createAt: json['createAt'] as String,
      id: json['id'] as String,
      role: $enumDecodeNullable(_$RoleEnumMap, json['role']) ?? Role.regular,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'userName': instance.userName,
      'email': instance.email,
      'createAt': instance.createAt,
      'role': _$RoleEnumMap[instance.role]!,
    };

const _$RoleEnumMap = {
  Role.regular: 'regular',
  Role.admin: 'admin',
};
