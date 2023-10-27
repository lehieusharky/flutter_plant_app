import 'package:equatable/equatable.dart';

class CommunityPostEntity extends Equatable {
  final String title;
  final String description;
  final List<String> tags;
  final String image;

  const CommunityPostEntity({
    required this.title,
    required this.description,
    required this.tags,
    required this.image,
  });
  @override
  List<Object?> get props => [];
}
