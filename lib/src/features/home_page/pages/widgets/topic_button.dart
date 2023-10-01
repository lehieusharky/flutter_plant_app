import 'package:flutter/material.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_button.dart';
import 'package:plant_market/src/theme/color_theme.dart';
import 'package:plant_market/src/theme/font_theme.dart';

class TopicButton extends StatefulWidget {
  final void Function() onPressed;
  final Color shadowColor;
  final Color backgroundColor;
  final String title;
  final IconData icon;
  final bool isChoosed;
  final bool? isFistIndex;
  const TopicButton({
    super.key,
    required this.onPressed,
    required this.shadowColor,
    required this.backgroundColor,
    required this.title,
    required this.icon,
    this.isFistIndex,
    required this.isChoosed,
  });

  @override
  State<TopicButton> createState() => _TopicButtonState();
}

class _TopicButtonState extends State<TopicButton> {
  var _backgroundColor = colorTheme.getFFFFFF;
  void onPressed() {
    widget.onPressed;
    setState(() {
      _backgroundColor = widget.backgroundColor;
    });
  }

  @override
  void initState() {
    super.initState();
    _backgroundColor = widget.isFistIndex == null
        ? colorTheme.getFFFFFF
        : widget.backgroundColor;
  }

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      boxShadowColor: widget.shadowColor,
      width: context.sizeWidth(108),
      height: context.sizeHeight(76),
      label: 'Hello',
      borderRadius: 3,
      onPress: () => onPressed(),
      backgroundColor: _backgroundColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            widget.icon,
            size: context.sizeWidth(24),
            color: colorTheme.getFFFFFF,
          ),
          context.sizedBox(height: 9),
          Text(
            widget.title,
            style: AppTextTheme.getDefaultTextTheme(context).labelMedium,
          ),
        ],
      ),
    );
  }
}
