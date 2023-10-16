import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:plant_market/src/features/user/data/datasources/local/image_picker_datasource.dart';

@Injectable(as: ImagePickerDataSource)
class ImagePickerDataSourceImpl implements ImagePickerDataSource {
  @override
  Future<File?> getImageFromCamera() async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(
        source: ImageSource.camera,
        preferredCameraDevice: CameraDevice.rear,
        imageQuality: 80,
      );
      return File(image!.path);
    } catch (e) {
      throw Exception(e);
    }
  }
}
