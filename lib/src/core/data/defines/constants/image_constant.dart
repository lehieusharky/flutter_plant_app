import 'package:injectable/injectable.dart';
import 'package:plant_market/src/core/di/di.dart';

ImageConstant get imageConstant => injector.get<ImageConstant>();

abstract class ImageConstant {
  String get tree1Json;
  String get tree2Json;
  String get tree3Json;
  String get tree4Json;
  String get rainJson;
  String get trainJson;
  String get nightJson;
  String get heartSvg;
  String get leafPlusSvg;
  String get leavesSVG;
  String get languageSVG;
  String get themeSVG;
  String get privacySVG;
  String get deleteAccountSVG;
  String get contactUsSVG;
  String get userInformationSVG;
  String get appleSVG;
  String get googleSVG;
  String get communitySVG;
  String get mapSVG;
  String get vietNamFlagSVG;
  String get englandFlagSVG;
  String get sunnyImage;
  String get nightImage;
  String get minTempSVG;
  String get maxTempSVG;
  String get windSVG;
  String get locationSVG;
  String get humiditySVG;
  String get chickenSVG;
  String get binocularsSVG;
  String get sunSVG;
  String get moonSVG;
  String get sadSVG;
  String get funSVG;
  String get deseaseSVG;
  String get flowerSVG;
  String get fruitSVG;
  String get leafSVG;
  String get plantSVG;
  String get vegetableSVG;
  String get cycleSVG;
  String get landSVG;
}

@Injectable(as: ImageConstant)
class ImageConstantImpl implements ImageConstant {
  @override
  String get tree1Json => 'assets/lotties/tree_1.json';

  @override
  String get tree2Json => 'assets/lotties/tree_2.json';

  @override
  String get tree3Json => 'assets/lotties/tree_3.json';

  @override
  String get tree4Json => 'assets/lotties/tree_4.json';

  @override
  String get rainJson => 'assets/lotties/rain.json';

  @override
  String get trainJson => 'assets/lotties/train.json';

  @override
  String get nightJson => 'assets/lotties/night.json';

  @override
  String get heartSvg => 'assets/svg/heart.svg';

  @override
  String get leavesSVG => 'assets/svg/leaves.svg';

  @override
  String get appleSVG => 'assets/svg/apple.svg';

  @override
  String get googleSVG => 'assets/svg/google.svg';

  @override
  String get communitySVG => 'assets/svg/community.svg';

  @override
  String get mapSVG => 'assets/svg/map.svg';

  @override
  String get englandFlagSVG => 'assets/svg/england_flag.svg';

  @override
  String get vietNamFlagSVG => 'assets/svg/viet_nam_flag.svg';

  @override
  String get nightImage => 'assets/images/night.png';

  @override
  String get sunnyImage => 'assets/images/sun.png';

  @override
  String get chickenSVG => 'assets/svg/chicken.svg';
  @override
  String get humiditySVG => 'assets/svg/humidity.svg';

  @override
  String get locationSVG => 'assets/svg/location.svg';

  @override
  String get maxTempSVG => 'assets/svg/max_temp.svg';

  @override
  String get minTempSVG => 'assets/svg/min_temp.svg';

  @override
  String get windSVG => 'assets/svg/wind.svg';

  @override
  String get binocularsSVG => 'assets/svg/binoculars.svg';

  @override
  String get sunSVG => 'assets/svg/sun.svg';

  @override
  String get moonSVG => 'assets/svg/moon.svg';

  @override
  String get funSVG => 'assets/svg/sad.svg';

  @override
  String get sadSVG => 'assets/svg/fun.svg';

  @override
  String get deseaseSVG => 'assets/svg/disease.svg';

  @override
  String get flowerSVG => 'assets/svg/flower.svg';

  @override
  String get fruitSVG => 'assets/svg/fruit.svg';

  @override
  String get leafSVG => 'assets/svg/leaf.svg';

  @override
  String get plantSVG => 'assets/svg/plant.svg';

  @override
  String get vegetableSVG => 'assets/svg/vegetable.svg';

  @override
  String get cycleSVG => 'assets/svg/cycle.svg';

  @override
  String get landSVG => 'assets/svg/land.svg';

  @override
  String get languageSVG => 'assets/svg/language.svg';

  @override
  String get privacySVG => 'assets/svg/privacy.svg';

  @override
  String get themeSVG => 'assets/svg/theme.svg';

  @override
  String get contactUsSVG => 'assets/svg/contact_us.svg';

  @override
  String get deleteAccountSVG => 'assets/svg/delete_account.svg';

  @override
  String get userInformationSVG => 'assets/svg/user_information.svg';

  @override
  String get leafPlusSvg => 'assets/svg/leaf_plus.svg';
}
