import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/features/my_app/presentation/bloc/my_app_bloc.dart';
import 'package:plant_market/src/theme/theme_manager.dart';

class CustomBackButton extends StatelessWidget {
  final Color? color;
  const CustomBackButton({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyAppBloc, MyAppState>(
      builder: (context, state) {
        return IconButton(
          onPressed: () {
            context.pop(true);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: color ?? ThemeManager.backgroundButton(),
            size: context.sizeWidth(40),
          ),
        );
      },
    );
  }
}
