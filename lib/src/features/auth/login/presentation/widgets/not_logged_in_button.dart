import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:plant_market/src/core/data/defines/constants/app_constant.dart';
import 'package:plant_market/src/core/di/part_di.dart';
import 'package:plant_market/src/core/extension/localization.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_button.dart';
import 'package:plant_market/src/router/router_path.dart';
import 'package:plant_market/src/theme/color_theme.dart';

class NotLoggedInButton extends StatelessWidget {
  const NotLoggedInButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildPersonSymbol(context),
        context.sizedBox(height: 5),
        _buildNotification(context),
        context.sizedBox(height: 15),
        _buildLoginButton(context),
      ],
    );
  }

  void _navigateToLoginpage(BuildContext context) {
    context.go(RouterPath.loginPageChild, extra: {
      AppConstant.isFromDashBoardRouter: true,
    });
  }

  Widget _buildLoginButton(BuildContext context) {
    return CustomButton.send(
      width: context.sizeWidth(190),
      title: translate(context).login,
      context: context,
      onPressed: () => _navigateToLoginpage(context),
    );
  }

  Widget _buildNotification(BuildContext context) {
    return Text(
      '${translate(context).youAreNotLoggedIn}\n${translate(context).pleaseLoginToContinue}',
      style: theme(context).textTheme.titleMedium!.copyWith(height: 1.4),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildPersonSymbol(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: context.sizeWidth(75),
      height: context.sizeWidth(75),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: theme(context).textTheme.titleMedium!.color!.withOpacity(0.1),
      ),
      child: Icon(
        Icons.person,
        size: context.sizeWidth(55),
        color: colorTheme.get2DDA93,
      ),
    );
  }
}
