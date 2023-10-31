import 'package:equatable/equatable.dart';

class CommunityPostEntity extends Equatable {
  final String id;
  final String title;
  final String description;
  final List<String> tags;
  final String image;
  final String authorId;
  final int clap;
  final String authorName;
  final String createAt;

  const CommunityPostEntity({
    required this.title,
    required this.description,
    required this.tags,
    required this.authorId,
    required this.authorName,
    required this.image,
    required this.createAt,
    required this.id,
    required this.clap,
  });
  @override
  List<Object?> get props => [];
}
