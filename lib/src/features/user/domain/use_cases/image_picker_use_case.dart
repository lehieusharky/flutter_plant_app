import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:plant_market/src/core/di/di.dart';
import 'package:plant_market/src/core/failure/failure.dart';
import 'package:plant_market/src/core/use_cases/use_case.dart';
import 'package:plant_market/src/features/user/domain/repositories/image_picker_repository.dart';

ImagePickerUseCase get imagePickerUseCase => injector.get<ImagePickerUseCase>();

abstract class ImagePickerUseCase {
  Future<File?> getImageFromCamera();
}

@Injectable(as: ImagePickerUseCase)
class ImagePickerUseCaseImpl extends UseCase<void, NoParams>
    implements ImagePickerUseCase {
  final ImagePickerRepository _imagePickerRepository;

  ImagePickerUseCaseImpl(this._imagePickerRepository);

  @override
  Future<void> call(NoParams params) {
    throw UnimplementedError();
  }

  @override
  Future<File?> getImageFromCamera() async {
    try {
      final result = await _imagePickerRepository.getImageFromCamera();
      return result.fold(
        (failure) {

          return;
        },
        (image) => image,
      );
    } catch (e) {
      throw ImagePickerFailure(message: e.toString());
    }
  }
}
