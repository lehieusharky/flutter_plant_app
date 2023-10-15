import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:plant_market/src/core/failure/failure.dart';
import 'package:plant_market/src/features/user/data/datasources/local/image_picker_datasource.dart';
import 'package:plant_market/src/features/user/domain/repositories/image_picker_repository.dart';

@Injectable(as: ImagePickerRepository)
class ImagePickerRepositoryImpl implements ImagePickerRepository {
  final ImagePickerDataSource _imagePickerDataSource;

  ImagePickerRepositoryImpl(this._imagePickerDataSource);

  @override
  Future<Either<ImagePickerFailure, File?>> getImageFromCamera() async {
    try {
      final result = await _imagePickerDataSource.getImageFromCamera();
      return Right(result);
    } catch (e) {
      return Left(ImagePickerFailure(message: e.toString()));
    }
  }
}
