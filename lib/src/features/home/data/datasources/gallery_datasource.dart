import 'dart:io';

abstract class GalleryDataSource {
  Future<void> postImageToPublicGallery({required File imageFile});
  Future<List<String>> getImageFromPublicGallery();
}
