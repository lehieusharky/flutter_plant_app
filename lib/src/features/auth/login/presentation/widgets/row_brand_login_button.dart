import 'package:flutter/material.dart';
import 'package:plant_market/src/core/data/defines/constants/app_constant.dart';
import 'package:plant_market/src/core/data/defines/constants/image_constant.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/features/auth/login/presentation/widgets/brand_login_button.dart';

class RowBrandLoginButton extends StatelessWidget {
  const RowBrandLoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: BrandLoginButton(
            brandName: AppConstant.google,
            brandSymbolPath: imageConstant.googleSVG,
            onPressed: () {},
          ),
        ),
        context.sizedBox(width: 20),
        Flexible(
          child: BrandLoginButton(
            brandName: AppConstant.apple,
            brandSymbolPath: imageConstant.appleSVG,
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
