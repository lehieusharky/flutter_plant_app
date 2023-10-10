import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:plant_market/src/core/di/di.dart';

ColorTheme get colorTheme => injector.get<ColorTheme>();

abstract class ColorTheme {
  Color get get2DDA93;
  Color get get36455A;
  Color get get495566;
  Color get get495566WithOpacity80;
  Color get get6A6F7D;
  Color get getFF6262;
  Color get get2F91EB;
  Color get getFFCD00;
  Color get getFBFDFF;
  Color get getD2D2D2;
  Color get getFFFFFF;
  Color get get2cd992;
  Color get get0A4D68;
  Color get get313552;
  Color get get0B1121;
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

  @override
  Color get get495566WithOpacity80 => const Color(0xff495566).withOpacity(0.8);

  @override
  Color get getFBFDFF => const Color(0xffFBFDFF);

  @override
  Color get getD2D2D2 => const Color(0xffD2D2D2);

  @override
  Color get getFFFFFF => const Color(0xffFFFFFF);

  @override
  Color get get2cd992 => const Color(0xff2cd992);

  @override
  Color get get0A4D68 => const Color(0xff0A4D68);

  @override
  Color get get313552 => const Color(0xff313552);

  @override
  Color get get0B1121 => const Color(0xff0B1121);
}
