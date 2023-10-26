import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:plant_market/src/core/failure/failure.dart';
import 'package:plant_market/src/features/home/data/datasources/gallery_datasource.dart';
import 'package:plant_market/src/features/home/domain/repositories/gallery_repository.dart';

@Injectable(as: GalleryRepository)
class GalleryDataSourceImpl implements GalleryRepository {
  final GalleryDataSource _galleryDataSource;

  GalleryDataSourceImpl(this._galleryDataSource);
  @override
  Future<Either<GalleryFailure, void>> postImageToPublicGallery(
      {required File imageFile}) async {
    try {
      final result = await _galleryDataSource.postImageToPublicGallery(
          imageFile: imageFile);
      return Right(result);
    } catch (e) {
      return Left(GalleryFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<GalleryFailure, List<String>>>
      getImageFromPublicGallery() async {
    try {
      final gallery = await _galleryDataSource.getImageFromPublicGallery();
      return Right(gallery);
    } catch (e) {
      return Left(GalleryFailure(message: e.toString()));
    }
  }
}
