import 'package:flutter/material.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_button.dart';
import 'package:plant_market/src/theme/color_theme.dart';
import 'package:plant_market/src/theme/font_theme.dart';

class TopicButton extends StatefulWidget {
  final void Function() onPressed;
  final Color backgroundColor;
  final String title;
  final IconData icon;
  final int isChoosed;
  final int defaultIndex;
  const TopicButton({
    super.key,
    required this.onPressed,
    required this.backgroundColor,
    required this.title,
    required this.icon,
    required this.isChoosed,
    required this.defaultIndex,
  });

  @override
  State<TopicButton> createState() => _TopicButtonState();
}

class _TopicButtonState extends State<TopicButton> {
  var _checkIsChoosed = false;

  @override
  Widget build(BuildContext context) {
    // compare default index with indexOfButton which is choosed

    _checkIsChoosed = _checkIschoosed();
    return CustomButton(
      boxShadowColor: _checkIsChoosed
          ? colorTheme.get2DDA93.withOpacity(0.4)
          : Colors.transparent,
      width: context.sizeWidth(108),
      height: context.sizeHeight(76),
      label: 'Hello',
      borderRadius: 3,
      onPress: widget.onPressed,
      backgroundColor:
          _checkIsChoosed ? widget.backgroundColor : colorTheme.getFFFFFF,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            widget.icon,
            size: context.sizeWidth(24),
            color:
                _checkIsChoosed ? colorTheme.getFFFFFF : colorTheme.get2DDA93,
          ),
          context.sizedBox(height: 9),
          Text(
            widget.title,
            style: _checkIsChoosed
                ? AppTextTheme.getDefaultTextTheme(context).labelMedium
                : AppTextTheme.getDefaultTextTheme(context).labelSmall,
          ),
        ],
      ),
    );
  }

  bool _checkIschoosed() {
    return widget.defaultIndex == widget.isChoosed ? true : false;
  }
}
