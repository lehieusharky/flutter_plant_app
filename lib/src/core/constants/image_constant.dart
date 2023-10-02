part of '../constants.dart';

ImageConstant get imageConstant => injector.get<ImageConstant>();

abstract class ImageConstant {
  String get testImage;
  String get tree1;
  String get tree2;
  String get tree3;
  String get tree4;
  String get heartSvg;
  String get leavesSVG;
  String get appleSVG;
  String get googleSVG;
}

@Injectable(as: ImageConstant)
class ImageConstantImpl implements ImageConstant {
  @override
  String get testImage => 'assets/images/test_image.png';

  @override
  String get tree1 => 'assets/lotties/tree_1.json';

  @override
  String get tree2 => 'assets/lotties/tree_2.json';

  @override
  String get tree3 => 'assets/lotties/tree_3.json';

  @override
  String get tree4 => 'assets/lotties/tree_4.json';

  @override
  String get heartSvg => 'assets/svg/heart.svg';

  @override
  String get leavesSVG => 'assets/svg/leaves.svg';

  @override
  String get appleSVG => 'assets/svg/apple.svg';

  @override
  String get googleSVG => 'assets/svg/google.svg';
}
