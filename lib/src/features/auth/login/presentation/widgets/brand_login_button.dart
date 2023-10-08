import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_market/src/core/data/datasource/local/share_preference_datasource.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_button.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_svg.dart';
import 'package:plant_market/src/features/my_app/presentation/bloc/my_app_bloc.dart';
import 'package:plant_market/src/theme/color_theme.dart';
import 'package:plant_market/src/theme/text_theme.dart';

class BrandLoginButton extends StatelessWidget {
  final void Function() onPressed;
  final String brandName;
  final String brandSymbolPath;
  const BrandLoginButton({
    super.key,
    required this.onPressed,
    required this.brandName,
    required this.brandSymbolPath,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyAppBloc, MyAppState>(
      builder: (context, state) {
        return CustomButton(
          foregroundColor: colorTheme.get2DDA93.withOpacity(0.5),
          width: context.width,
          height: context.sizeHeight(50),
          onPress: onPressed,
          boxShadowColor: colorTheme.getD2D2D2
              .withOpacity(sharePreference.isDarkMode() ? 0 : 0.4),
          backgroundColor: sharePreference.isDarkMode()
              ? colorTheme.get0A4D68
              : colorTheme.getFFFFFF,
          borderRadius: 5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomSvg(
                path: brandSymbolPath,
                width: context.sizeWidth(50),
              ),
              Text(
                brandName,
                style: AppTextTheme.lightTheme(context).titleMedium!.copyWith(
                      color: sharePreference.isDarkMode()
                          ? colorTheme.getFFFFFF
                          : colorTheme.get6A6F7D,
                    ),
              ),
            ],
          ),
        );
      },
    );
  }
}
