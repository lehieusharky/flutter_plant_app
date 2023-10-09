import 'package:equatable/equatable.dart';

class TimeLineEntity extends Equatable {
  final String title;
  final String description;
  final String image;
  final String createAt;
  final bool? isLast;

  const TimeLineEntity({
    required this.title,
    required this.description,
    required this.image,
    required this.isLast,
    required this.createAt,
  });

  @override
  List<Object?> get props => [title, description, image, createAt, isLast];
}
