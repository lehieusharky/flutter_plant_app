import 'package:flutter/material.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_title.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/toggle_language_button.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/toggle_theme_button.dart';
import 'package:plant_market/src/core/presentation/page/base_page.dart';
import 'package:plant_market/src/features/setting/presentation/widgets/setting_button.dart';

class SettingPage extends BaseWidget {
  const SettingPage({super.key});

  @override
  BaseWidgetState createState() => _SettingPageState();
}

class _SettingPageState extends BaseWidgetState
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BaseWidget(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomTitle(title: 'System'),
          const ToggleThemeButton(),
          const SettingButton(title: 'Theme', value: 'Light'),
          context.sizedBox(height: 8),
          const SettingButton(title: 'Language', value: 'English'),
          const ToggleLanguageButton(),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
