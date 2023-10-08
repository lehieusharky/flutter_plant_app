import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:plant_market/src/core/data/datasource/local/share_preference_datasource.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/features/my_app/presentation/bloc/my_app_bloc.dart';
import 'package:plant_market/src/theme/color_theme.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

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
            color: sharePreference.isDarkMode()
                ? colorTheme.getFFFFFF
                : colorTheme.get36455A,
            size: context.sizeWidth(30),
          ),
        );
      },
    );
  }
}
