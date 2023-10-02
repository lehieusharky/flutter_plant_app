class PostModel {
  final String id;
  final String author;
  final String title;
  final String description;
  final List<String> listImage;
  final String createAt;

  PostModel({
    required this.id,
    required this.title,
    required this.author,
    required this.description,
    required this.listImage,
    required this.createAt,
  });
}
