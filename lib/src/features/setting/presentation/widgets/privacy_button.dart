import 'package:flutter/material.dart';
import 'package:plant_market/src/core/data/defines/constants/image_constant.dart';
import 'package:plant_market/src/core/extension/localization.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/features/setting/presentation/widgets/setting_button.dart';

class PrivacyPolicyButton extends StatelessWidget {
  const PrivacyPolicyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SettingButton(
          title: translate(context).privacyPolicy,
          field: '',
          onPressed: () {},
          iconTitlePath: imageConstant.privacySVG,
        ),
        context.sizedBox(height: 8),
        SettingButton(
          title: translate(context).contactWithUs,
          field: '',
          onPressed: () {},
          iconTitlePath: imageConstant.contactUsSVG,
        ),
      ],
    );
  }
}
