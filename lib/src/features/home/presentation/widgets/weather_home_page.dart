import 'package:flutter/material.dart';
import 'package:plant_market/src/core/data/defines/constants/image_constant.dart';
import 'package:plant_market/src/core/di/di_set_up.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_svg.dart';
import 'package:plant_market/src/features/home/presentation/widgets/weather_background.dart';
import 'package:plant_market/src/theme/color_theme.dart';
import 'package:plant_market/src/theme/text_theme.dart';

class WeatherHomeage extends StatelessWidget {
  const WeatherHomeage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        const WeatherBackGround(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '27°C',
              style: theme(context).textTheme.displayMedium,
            ),
            context.sizedBox(width: 5),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildRowItem(
                  iconPath: imageConstant.humiditySVG,
                  value: '11 %',
                  context: context,
                ),
                _buildRowItem(
                  iconPath: imageConstant.windSVG,
                  value: '55 m/s',
                  context: context,
                ),
                _buildRowItem(
                  iconPath: imageConstant.locationSVG,
                  value: 'Ho Chi Minh',
                  context: context,
                ),
              ],
            )
          ],
        )
      ],
    );
  }

  Widget _buildRowItem({
    required String iconPath,
    required String value,
    required BuildContext context,
  }) {
    return Padding(
      padding: context.padding(vertical: 2),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomSvg(
            path: iconPath,
            color: colorTheme.getFFFFFF,
            width: context.sizeWidth(45),
            height: context.sizeHeight(30),
          ),
          context.sizedBox(width: 5),
          Text(
            value,
            style: AppTextTheme.darkTheme(context).titleLarge,
          ),
        ],
      ),
    );
  }
}
