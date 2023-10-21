import 'package:flutter/material.dart';
import 'package:plant_market/src/core/data/defines/constants/image_constant.dart';
import 'package:plant_market/src/core/extension/localization.dart';
import 'package:plant_market/src/features/setting/presentation/widgets/setting_button.dart';

class UserInfomationButton extends StatelessWidget {
  const UserInfomationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingButton(
      title: translate(context).userInfomation,
      field: '',
      onPressed: () {},
      iconTitlePath: imageConstant.userInformationSVG,
    );
  }
}
