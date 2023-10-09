import 'package:plant_market/src/features/user/domain/entities/time_line_entity.dart';

class TimeLineModel extends TimeLineEntity {
  const TimeLineModel({
    required super.title,
    required super.description,
    required super.image,
    required super.isLast,
    required super.createAt,
  });
}
