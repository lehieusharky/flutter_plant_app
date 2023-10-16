import 'package:flutter/material.dart';
import 'package:plant_market/src/core/di/di_set_up.dart';
import 'package:plant_market/src/core/extension/localization.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_button.dart';

class AddPhotosButton extends StatelessWidget {
  final void Function() onPressed;
  const AddPhotosButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      width: context.sizeWidth(135),
      height: context.sizeHeight(112),
      onPress: onPressed,
      backgroundColor:
          theme(context).textTheme.titleMedium!.color!.withOpacity(0.1),
      borderRadius: 5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.camera_alt,
            size: context.sizeWidth(40),
            color: theme(context).textTheme.titleMedium!.color,
          ),
          context.sizedBox(height: 5),
          Text(
            translate(context).addPhotos,
            style: theme(context).textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}
