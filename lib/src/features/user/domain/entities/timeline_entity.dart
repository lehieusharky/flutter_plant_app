import 'package:equatable/equatable.dart';

class TimeLineEntity extends Equatable {
  final String userId;
  final String timeLineId;
  final String description;
  final String image;
  final String createAt;

  const TimeLineEntity({
    required this.description,
    required this.image,
    required this.createAt,
    required this.userId,
    required this.timeLineId,
  });

  @override
  List<Object?> get props => [userId, timeLineId, description, image, createAt];
}
