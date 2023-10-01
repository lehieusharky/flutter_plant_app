import 'package:flutter/material.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_button.dart';
import 'package:plant_market/src/theme/font_theme.dart';

class TopicButton extends StatefulWidget {
  final void Function() onPressed;

  final Color shadowColor;
  final Color backgroundColor;
  const TopicButton({
    super.key,
    required this.onPressed,
    required this.shadowColor, required this.backgroundColor,
  });

  @override
  State<TopicButton> createState() => _TopicButtonState();
}

class _TopicButtonState extends State<TopicButton> {
  @override
  Widget build(BuildContext context) {
    return CustomButton(
      width: context.sizeWidth(108),
      height: context.sizeHeight(76),
      label: 'Hello',
      borderRadius: 3,
      onPress: widget.onPressed,
      backgroundColor: widget.backgroundColor,
      shadowColor: widget.shadowColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.camera),
          context.sizedBox(height: 9),
          Text(
            'IDENTIFY',
            style: AppTextTheme.getDefaultTextTheme(context).labelMedium,
          ),
        ],
      ),
    );
  }
}
