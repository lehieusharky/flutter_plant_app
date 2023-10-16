import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:plant_market/src/core/data/defines/constants/app_constant.dart';
import 'package:plant_market/src/core/di/di_set_up.dart';
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
        Container(
          alignment: Alignment.center,
          width: context.sizeWidth(75),
          height: context.sizeWidth(75),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color:
                theme(context).textTheme.titleMedium!.color!.withOpacity(0.1),
          ),
          child: Icon(
            Icons.person,
            size: context.sizeWidth(55),
            color: colorTheme.get2DDA93,
          ),
        ),
        context.sizedBox(height: 5),
        Text(
          'You are not logged in\nPlease login to continue 😳',
          style: theme(context).textTheme.titleMedium!.copyWith(height: 1.4),
          textAlign: TextAlign.center,
        ),
        context.sizedBox(height: 15),
        CustomButton.send(
          width: context.sizeWidth(190),
          title: 'Login',
          context: context,
          onPressed: () => _navigateToLoginpage(context),
        ),
      ],
    );
  }

  void _navigateToLoginpage(BuildContext context) {
    context.go(RouterPath.loginPageChild, extra: {
      AppConstant.isFromDashBoardRouter: true,
    });
  }
}
