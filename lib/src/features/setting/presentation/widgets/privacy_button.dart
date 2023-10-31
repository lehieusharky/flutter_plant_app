import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:plant_market/src/core/data/defines/constants/image_constant.dart';
import 'package:plant_market/src/core/extension/localization.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/features/setting/presentation/widgets/send_email_button.dart';
import 'package:plant_market/src/features/setting/presentation/widgets/setting_button.dart';
import 'package:url_launcher/url_launcher.dart';

class PrivacyPolicyButton extends StatefulWidget {
  const PrivacyPolicyButton({super.key});

  @override
  State<PrivacyPolicyButton> createState() => _PrivacyPolicyButtonState();
}

class _PrivacyPolicyButtonState extends State<PrivacyPolicyButton> {
  final Uri privacyUrl = Uri.parse(dotenv.get(
    'PRIVACY_POLYCY_URL',
    fallback: 'PRIVACY_POLYCY_URL_NOT_FOUND',
  ));

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SettingButton(
          title: translate(context).privacyPolicy,
          field: '',
          onPressed: _launchUrl,
          iconTitlePath: imageConstant.privacySVG,
        ),
        context.sizedBox(height: 8),
        const SendEmailButton()
      ],
    );
  }

  Future<void> _launchUrl() async {
    if (!await launchUrl(privacyUrl)) {
      throw Exception('Could not launch $privacyUrl');
    }
  }
}
