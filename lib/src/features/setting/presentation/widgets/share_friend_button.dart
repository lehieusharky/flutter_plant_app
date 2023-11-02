import 'package:flutter/material.dart';
import 'package:plant_market/src/core/di/part_di.dart';
import 'package:plant_market/src/core/extension/localization.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_button.dart';
import 'package:plant_market/src/theme/color_theme.dart';
import 'package:plant_market/src/theme/theme_manager.dart';

class ShareFriendButton extends StatefulWidget {
  const ShareFriendButton({super.key});

  @override
  State<ShareFriendButton> createState() => _ShareFriendButtonState();
}

class _ShareFriendButtonState extends State<ShareFriendButton> {
  @override
  Widget build(BuildContext context) {
    return CustomButton(
      width: context.width,
      height: context.sizeHeight(55),
      onPress: () {},
      backgroundColor: ThemeManager.backgroundButton(),
      borderRadius: 3,
      borderSide: BorderSide(
        color: colorTheme.get2DDA93,
        width: 2,
      ),
      child: _buildTitle(context),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          translate(context).shareFriends,
          style: theme(context).textTheme.titleMedium,
        ),
        context.sizedBox(width: 5),
        Icon(Icons.share, color: theme(context).textTheme.titleMedium!.color)
      ],
    );
  }
}
