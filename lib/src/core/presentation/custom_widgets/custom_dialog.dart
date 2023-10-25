import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:plant_market/src/core/di/part_di.dart';
import 'package:plant_market/src/theme/theme_manager.dart';

class CustomDialog {
  static baseDialog({
    required BuildContext context,
    required String title,
    required Widget? content,
    void Function()? onConfirm,
    void Function()? onCancel,
    required String confirmText,
    required String cancelText,
  }) {
    showDialog<void>(
      context: context,
      
      builder: (BuildContext context) {
        return AlertDialog(
          
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: Text(
            title,
            style: theme(context).textTheme.titleLarge,
          ),
          content: content,
          actions: <Widget>[
            TextButton(
              onPressed: onCancel ?? () => context.pop(true),
              child: Text(cancelText,
                  style: theme(context).textTheme.titleMedium!.copyWith(
                      color: theme(context)
                          .textTheme
                          .titleMedium!
                          .color!
                          .withOpacity(0.8))),
            ),
            TextButton(
              onPressed: onConfirm,
              child: Text(confirmText,
                  style: theme(context).textTheme.titleMedium!),
            ),
          ],
        );
      },
    );
  }
}
