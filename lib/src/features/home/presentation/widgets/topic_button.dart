import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_market/src/core/data/datasource/local/share_preference_datasource.dart';
import 'package:plant_market/src/core/data/defines/enum/supported_theme.dart';
import 'package:plant_market/src/core/di/di_set_up.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_button.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_svg.dart';
import 'package:plant_market/src/features/home/data/enum/topic_symbol.dart';
import 'package:plant_market/src/features/my_app/presentation/bloc/my_app_bloc.dart';
import 'package:plant_market/src/theme/color_theme.dart';
import 'package:plant_market/src/theme/text_theme.dart';

class TopicButton extends StatefulWidget {
  final void Function() onPressed;
  final String title;
  final TopicSymbol isChoosed;
  final TopicSymbol topicSymbol;
  final String pathIcon;
  const TopicButton({
    super.key,
    required this.onPressed,
    required this.title,
    required this.isChoosed,
    required this.pathIcon,
    required this.topicSymbol,
  });

  @override
  State<TopicButton> createState() => _TopicButtonState();
}

class _TopicButtonState extends State<TopicButton> {
  var _isChoosed = false;

  @override
  Widget build(BuildContext context) {
    // * compare default index with indexOfButton which is choosed
    _isChoosed = _checkIschoosed();
    log('theme: ${sharePreference.getTheme().name}');

    return BlocBuilder<MyAppBloc, MyAppState>(
      builder: (context, state) {
        return CustomButton(
          boxShadowColor: colorTheme.get6A6F7D.withOpacity(0.1),
          width: context.sizeWidth(105),
          height: context.sizeHeight(80),
          borderRadius: 3,
          onPress: widget.onPressed,
          backgroundColor: _color(
            isChoosed: _isChoosed,
            lightFocus: colorTheme.get2DDA93,
            darkFocus: colorTheme.get2DDA93,
            lightUnFocus: colorTheme.getFFFFFF,
            darkUnFocus: colorTheme.get252A3D,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildSymbol(),
              context.sizedBox(height: 5),
              Expanded(child: _buildTitle()),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSymbol() {
    return CustomSvg(
      path: widget.pathIcon,
      width: context.sizeWidth(24),
      color: _isChoosed ? colorTheme.getFFFFFF : colorTheme.get2DDA93,
    );
  }

  Widget _buildTitle() {
    return Text(
      widget.title,
      style: _isChoosed
          ? theme(context).textTheme.titleSmall!.copyWith(
              color: sharePreference.isDarkMode()
                  ? AppTextTheme.lightTheme(context).titleSmall!.color
                  : AppTextTheme.darkTheme(context).titleSmall!.color)
          : theme(context).textTheme.titleSmall!.copyWith(
              color: sharePreference.isDarkMode()
                  ? AppTextTheme.darkTheme(context).titleSmall!.color
                  : AppTextTheme.lightTheme(context).titleSmall!.color),
    );
  }

  Color _color({
    required bool isChoosed,
    required Color lightFocus,
    required Color darkFocus,
    required Color lightUnFocus,
    required Color darkUnFocus,
  }) {
    final themeMode = sharePreference.getTheme() == SupportedTheme.light
        ? ThemeMode.light
        : ThemeMode.dark;
    switch (themeMode) {
      case ThemeMode.light:
        if (isChoosed) {
          return lightFocus;
        } else {
          return lightUnFocus;
        }
      case ThemeMode.dark:
        if (isChoosed) {
          return darkFocus;
        } else {
          return darkUnFocus;
        }

      default:
        return lightFocus;
    }
  }

  bool _checkIschoosed() {
    return widget.topicSymbol == widget.isChoosed ? true : false;
  }
}
