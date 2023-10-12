import 'package:flutter/material.dart';
import 'package:plant_market/src/core/extension/localization.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_title.dart';
import 'package:plant_market/src/core/presentation/page/base_page.dart';
import 'package:plant_market/src/features/setting/presentation/widgets/theme_language_button.dart';

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
          CustomTitle(title: translate(context).system),
          context.sizedBox(height: 15),
          const ThemeLanguageButton(),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
