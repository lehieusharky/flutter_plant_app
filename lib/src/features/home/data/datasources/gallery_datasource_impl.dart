import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:plant_market/src/core/di/part_di.dart';
import 'package:plant_market/src/features/home/data/datasources/gallery_datasource.dart';
import 'package:uuid/uuid.dart';

@Injectable(as: GalleryDataSource)
class GalleryDataSourceImpl implements GalleryDataSource {
  @override
  Future<void> postImageToPublicGallery({required File imageFile}) async {
    try {
      final ext = imageFile.path.split('.').last;
      final today = DateTime.now().toString();
      List<String> selectedTime = today.split(' ');

      final imageRef = firebaseStorage
          .ref()
          .child('gallery/${selectedTime[0]}${const Uuid().v4()}.$ext');

      await imageRef.putFile(
          imageFile, SettableMetadata(contentType: 'image/$ext'));
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<String>> getImageFromPublicGallery() async {
    try {
      final today = DateTime.now().toString();
      List<String> selectedTime = today.split(' ');
      final galleryRef =
          firebaseStorage.ref().child('gallery/${selectedTime[0]}');

      final galleryResult = await galleryRef.listAll();

      final gallery = galleryResult.items.map((imageUrl) {
        final image = imageUrl.getDownloadURL();
        return image;
      }).toList();

      return Future.wait(gallery);
    } catch (e) {
      throw Exception(e);
    }
  }
}
