import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_market/src/core/di/di_set_up.dart';
import 'package:plant_market/src/core/extension/localization.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/features/setting/presentation/bloc/setting_bloc.dart';
import 'package:plant_market/src/theme/color_theme.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => _logOut(context),
      child: Padding(
        padding: context.padding(vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              translate(context).logOut,
              style: theme(context).textTheme.titleMedium!.copyWith(
                    color: colorTheme.getFF6262,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            context.sizedBox(width: 5),
            Icon(
              Icons.logout,
              color: colorTheme.getFF6262,
              size: context.sizeWidth(20),
            )
          ],
        ),
      ),
    );
  }

  void _logOut(BuildContext context) {
    context.read<SettingBloc>().add(SettingLogOut());
  }
}
