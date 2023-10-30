import 'package:flutter/widgets.dart';
import 'package:plant_market/src/core/data/defines/constants/image_constant.dart';
import 'package:plant_market/src/core/di/part_di.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_svg.dart';

class MusicTitle extends StatelessWidget {
  final String musicName;
  const MusicTitle({super.key, required this.musicName});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomSvg(
          path: imageConstant.musicSVG,
          width: context.sizeWidth(25),
          color: theme(context).textTheme.titleMedium!.color,
        ),
        context.sizedBox(width: 5),
        Text(
          musicName,
          style: theme(context).textTheme.titleLarge!.copyWith(
              color:
                  theme(context).textTheme.titleLarge!.color!.withOpacity(0.8)),
        ),
      ],
    );
  }
}
