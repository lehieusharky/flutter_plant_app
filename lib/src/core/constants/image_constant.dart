part of '../constants.dart';

ImageConstant get imageConstant => injector.get<ImageConstant>();

abstract class ImageConstant {
  String get image => 'assets/images/svg/image.svg';
}
