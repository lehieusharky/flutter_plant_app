import 'package:json_annotation/json_annotation.dart';
import 'package:plant_market/src/features/user/domain/entities/time_line_entity.dart';
part 'time_line_model.g.dart';

@JsonSerializable()
class TimeLineModel extends TimeLineEntity {
  const TimeLineModel({
    required super.description,
    required super.image,
    required super.createAt,
    required super.userId,
    required super.timeLineId,
  });

  factory TimeLineModel.fromJson(Map<String, dynamic> json) =>
      _$TimeLineModelFromJson(json);

  Map<String, dynamic> toJson() => _$TimeLineModelToJson(this);
}
