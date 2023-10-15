import 'dart:io';

abstract class ImagePickerDataSource {
  Future<File?> getImageFromCamera();
}
