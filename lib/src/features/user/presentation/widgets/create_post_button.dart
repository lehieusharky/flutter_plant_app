import 'package:flutter/material.dart';
import 'package:plant_market/src/core/di/di_set_up.dart';
import 'package:plant_market/src/core/extension/localization.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_button.dart';
import 'package:plant_market/src/theme/color_theme.dart';
import 'package:plant_market/src/theme/theme_manager.dart';

class CreatePostButton extends StatelessWidget {
  final void Function() onPressed;
  const CreatePostButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        _buildBackGround(context),
        CustomButton(
          borderSide: BorderSide(color: colorTheme.get2DDA93),
          width: context.width * 0.85,
          height: context.sizeHeight(50),
          onPress: onPressed,
          backgroundColor: ThemeManager.backgroundButton(),
          borderRadius: context.sizeWidth(5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              _buildTitle(context),
              _buildCameraIcon(context),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Text(
      translate(context).recordPlantProcess,
      style: theme(context).textTheme.titleMedium!.copyWith(
            color:
                theme(context).textTheme.titleMedium!.color!.withOpacity(0.6),
          ),
    );
  }

  Widget _buildCameraIcon(BuildContext context) {
    return Icon(
      Icons.camera_alt_outlined,
      size: context.sizeWidth(25),
      color: theme(context).textTheme.titleMedium!.color!.withOpacity(0.6),
    );
  }

  Widget _buildBackGround(BuildContext context) {
    return Container(
      width: context.width,
      height: context.sizeHeight(68),
      decoration: BoxDecoration(color: colorTheme.get2DDA93.withOpacity(0.1)),
    );
  }
}
