import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:plant_market/src/core/di/di.dart';

ColorTheme get colorTheme => injector.get<ColorTheme>();

abstract class ColorTheme {
  Color get get2DDA93;
  Color get get36455A;
  Color get get495566;
  Color get get6A6F7D;
  Color get getFF6262;
  Color get get2F91EB;
  Color get getFFCD00;
}

@Injectable(as: ColorTheme)
class ColorThemeImpl implements ColorTheme {
  @override
  Color get get2DDA93 => const Color(0xff2DDA93);

  @override
  Color get get36455A => const Color(0xff36455A);

  @override
  Color get get495566 => const Color(0xff495566);

  @override
  Color get get6A6F7D => const Color(0xff6A6F7D);

  @override
  Color get getFF6262 => const Color(0xffFF6262);

  @override
  Color get get2F91EB => const Color(0xff2F91EB);

  @override
  Color get getFFCD00 => const Color(0xffFFCD00);
}
