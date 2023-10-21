import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_market/src/core/data/datasource/local/share_preference_datasource.dart';
import 'package:plant_market/src/core/data/defines/constants/app_constant.dart';
import 'package:plant_market/src/core/data/defines/constants/image_constant.dart';
import 'package:plant_market/src/core/data/defines/enum/supported_theme.dart';
import 'package:plant_market/src/core/extension/localization.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_modal.dart';
import 'package:plant_market/src/features/my_app/presentation/bloc/my_app_bloc.dart';
import 'package:plant_market/src/features/setting/presentation/widgets/setting_button.dart';

class ThemeLanguageButton extends StatefulWidget {
  const ThemeLanguageButton({super.key});

  @override
  State<ThemeLanguageButton> createState() => _ThemeLanguageButtonState();
}

class _ThemeLanguageButtonState extends State<ThemeLanguageButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SettingButton(
          title: translate(context).language,
          field: sharePreference.getLanguage() == AppConstant.en
              ? translate(context).english
              : translate(context).vietnamese,
          onPressed: () => _showLanguageModal(), iconTitlePath: imageConstant.languageSVG,
        ),
        context.sizedBox(height: 8),
        SettingButton(
          title: translate(context).theme,
          field: sharePreference.isDarkMode()
              ? translate(context).dark
              : translate(context).light,
          onPressed: () => _showThemeModal(), iconTitlePath: imageConstant.themeSVG,
        ),
      ],
    );
  }

  void _showLanguageModal() {
    CustomModal.settingModal(
      context: context,
      title: translate(context).language,
      field1: translate(context).vietnamese,
      field2: translate(context).english,
      iconPath1: imageConstant.vietNamFlagSVG,
      iconPath2: imageConstant.englandFlagSVG,
      onPressed1: () => _toggleLanguage(languageCode: AppConstant.vi),
      onPressed2: () => _toggleLanguage(languageCode: AppConstant.en),
      isChoosed2: sharePreference.getLanguage() == AppConstant.en,
      isChoosed1: sharePreference.getLanguage() == AppConstant.vi,
    );
  }

  void _showThemeModal() {
    CustomModal.settingModal(
      context: context,
      title: translate(context).theme,
      field1: translate(context).light,
      field2: translate(context).dark,
      iconPath1: imageConstant.sunSVG,
      iconPath2: imageConstant.moonSVG,
      onPressed1: () => _toggleTheme(themeMode: ThemeMode.light),
      onPressed2: () => _toggleTheme(themeMode: ThemeMode.dark),
      isChoosed1: sharePreference.getTheme() == SupportedTheme.light,
      isChoosed2: sharePreference.getTheme() == SupportedTheme.dark,
    );
  }

  void _toggleLanguage({required String languageCode}) {
    context
        .read<MyAppBloc>()
        .add(MyAppToggleLanguage(languageCode: languageCode));
  }

  void _toggleTheme({required ThemeMode themeMode}) {
    context.read<MyAppBloc>().add(MyAppToogleTheme(themeMode: themeMode));
  }
}
