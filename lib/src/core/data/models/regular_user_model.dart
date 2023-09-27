import 'package:json_annotation/json_annotation.dart';
import 'package:plant_market/src/core/domain/entities/regular_user_entity.dart';
part 'regular_user_model.g.dart';

@JsonSerializable()
class RegularUserModel extends RegularUserEntity {
  const RegularUserModel({
    required super.userName,
    required super.email,
  });

  @override
  List<Object?> get props => [userName, email];

  factory RegularUserModel.fromJson(Map<String, dynamic> json) =>
      _$RegularUserModelFromJson(json);

  Map<String, dynamic> toJson() => _$RegularUserModelToJson(this);
}
