import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:plant_market/src/core/failure/failure.dart';

abstract class ImagePickerRepository {
  Future<Either<ImagePickerFailure, File?>> getImageFromCamera();
}
