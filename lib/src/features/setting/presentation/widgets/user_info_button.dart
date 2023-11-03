import 'package:flutter/material.dart';
import 'package:plant_market/src/core/data/defines/constants/image_constant.dart';
import 'package:plant_market/src/core/di/part_di.dart';
import 'package:plant_market/src/core/extension/localization.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_modal.dart';
import 'package:plant_market/src/features/setting/presentation/widgets/setting_button.dart';

class UserInfomationButton extends StatelessWidget {
  const UserInfomationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingButton(
      title: translate(context).userInfomation,
      field: '',
      onPressed: () => _showDeleteAccountModal(context),
      iconTitlePath: imageConstant.userInformationSVG,
    );
  }

  void _showDeleteAccountModal(BuildContext context) {
    CustomModal.baseModal(
      context: context,
      height: context.height * 0.8,
      child: Center(
        child: Text(
          translate(context).commingSoon,
          style: theme(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}
