import 'package:flutter/material.dart';
import 'package:plant_market/src/core/extension/localization.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_title.dart';
import 'package:plant_market/src/core/presentation/page/base_page.dart';
import 'package:plant_market/src/features/setting/presentation/widgets/delete_account_button.dart';
import 'package:plant_market/src/features/setting/presentation/widgets/log_out_button.dart';
import 'package:plant_market/src/features/setting/presentation/widgets/privacy_button.dart';
import 'package:plant_market/src/features/setting/presentation/widgets/share_friend_button.dart';
import 'package:plant_market/src/features/setting/presentation/widgets/theme_language_button.dart';
import 'package:plant_market/src/features/setting/presentation/widgets/user_info_button.dart';
import 'package:plant_market/src/features/setting/presentation/widgets/version_text.dart';

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
          context.sizedBox(height: 25),
          const CustomTitle(title: 'Account'),
          context.sizedBox(height: 15),
          const UserInfomationButton(),
          context.sizedBox(height: 8),
          const DeleteAccountButton(),
          context.sizedBox(height: 25),
          const CustomTitle(title: 'About'),
          context.sizedBox(height: 15),
          const PrivacyPolicyButton(),
          const Expanded(child: SizedBox()),
          Center(
              child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const ShareFriendButton(),
              context.sizedBox(height: 5),
              const LogoutButton(),
              const VersionText(),
              context.sizedBox(height: 5),
            ],
          )),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
