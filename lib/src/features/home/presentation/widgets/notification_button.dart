import 'package:flutter/material.dart';
import 'package:plant_market/src/core/di/part_di.dart';
import 'package:plant_market/src/core/extension/localization.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_background.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_modal.dart';

class NotificationButton extends StatelessWidget {
  const NotificationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Custombackground(
      width: context.sizeHeight(52),
      height: context.sizeHeight(52),
      borderRadius: context.sizeWidth(18),
      child: IconButton(
        onPressed: () => _showDeleteAccountModal(context),
        icon: Icon(
          Icons.notifications_active,
          color: theme(context).textTheme.titleMedium!.color!.withOpacity(0.7),
        ),
      ),
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
