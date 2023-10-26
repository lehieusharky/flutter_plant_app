import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:plant_market/src/core/failure/failure.dart';

abstract class GalleryRepository {
  Future<Either<GalleryFailure, void>> postImageToPublicGallery(
      {required File imageFile});

  Future<Either<GalleryFailure, List<String>>> getImageFromPublicGallery();
}
