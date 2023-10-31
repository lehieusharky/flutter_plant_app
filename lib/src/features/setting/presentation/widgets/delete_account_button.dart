import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_market/src/core/data/defines/constants/image_constant.dart';
import 'package:plant_market/src/core/extension/localization.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_modal.dart';
import 'package:plant_market/src/features/setting/presentation/bloc/setting_bloc.dart';
import 'package:plant_market/src/features/setting/presentation/widgets/setting_button.dart';
import 'package:plant_market/src/features/user/presentation/bloc/user_bloc.dart';

class DeleteAccountButton extends StatelessWidget {
  const DeleteAccountButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc(),
      child: SettingButton(
        title: translate(context).deleteAccount,
        field: '',
        onPressed: () => _showDeleteAccountModal(context),
        iconTitlePath: imageConstant.deleteAccountSVG,
      ),
    );
  }

  void _showDeleteAccountModal(BuildContext context) {
    CustomModal.settingModal(
      context: context,
      title: translate(context).deleteYourAccount,
      field1: translate(context).sure,
      field2: translate(context).cancel,
      iconPath1: imageConstant.funSVG,
      iconPath2: imageConstant.sadSVG,
      onPressed1: () => context.read<SettingBloc>().add(SettingDeleteAccount()),
      onPressed2: () => {},
      isChoosed2: false,
      isChoosed1: false,
    );
  }
}
