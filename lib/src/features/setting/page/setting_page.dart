import 'package:flutter/material.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/toggle_language_button.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/toggle_theme_button.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ToggleThemeButton(),
            ToggleLanguageButton(),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
