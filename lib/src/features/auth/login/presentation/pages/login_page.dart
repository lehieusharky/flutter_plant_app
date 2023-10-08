import 'package:flutter/material.dart';
import 'package:plant_market/src/core/extension/localization.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/toggle_theme_button.dart';
import 'package:plant_market/src/core/presentation/page/base_page.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_header_auth.dart';
import 'package:plant_market/src/features/auth/login/presentation/widgets/row_brand_login_button.dart';
import 'package:plant_market/src/features/auth/login/presentation/widgets/login_form.dart';

class LoginPage extends BaseWidget {
  const LoginPage({super.key});

  @override
  BaseWidgetState createState() => _LoginPageState();
}

class _LoginPageState extends BaseWidgetState {
  final phoneNumberController = TextEditingController();
  final keyForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Padding(
            padding: context.padding(top: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //* header
                CustomHeaderAuthentication(
                  title: translate(context).hello,
                  subTitle: translate(context).letsLearnMoreAboutPlants,
                ),
                context.sizedBox(height: 25),
                //* form
                FormLogin(
                  keyForm: keyForm,
                  phoneNumberController: phoneNumberController,
                ),
                context.sizedBox(height: 20),
                //* brand button
                const RowBrandLoginButton(),
                const ToggleThemeButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
