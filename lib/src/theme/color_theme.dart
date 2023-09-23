import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:plant_market/src/core/di/di.dart';

ColorTheme get colorTheme => injector.get<ColorTheme>();

abstract class ColorTheme {
  Color get get2DDA93;
}

@Injectable(as: ColorTheme)
class ColorThemeImpl implements ColorTheme {
  @override
  Color get get2DDA93 => const Color(0xff2DDA93);
}
