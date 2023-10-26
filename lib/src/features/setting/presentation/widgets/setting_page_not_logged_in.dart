import 'package:flutter/material.dart';
import 'package:plant_market/src/core/extension/localization.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_title.dart';
import 'package:plant_market/src/core/presentation/page/base_page.dart';
import 'package:plant_market/src/features/auth/login/presentation/widgets/not_logged_in_button.dart';
import 'package:plant_market/src/features/setting/presentation/widgets/theme_language_button.dart';

class SettingPageNotLoggedIn extends StatelessWidget {
  const SettingPageNotLoggedIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BaseWidget(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTitle(title: translate(context).system),
                context.sizedBox(height: 12),
                const ThemeLanguageButton(),
                context.sizedBox(height: 50),
              ],
            ),
          ),
          const NotLoggedInButton(),
        ],
      ),
    );
  }
}
