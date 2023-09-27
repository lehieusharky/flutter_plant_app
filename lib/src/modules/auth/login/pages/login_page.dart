import 'package:flutter/material.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/core/presentation/page/base_page.dart';
import 'package:plant_market/src/modules/auth/auth_widgets/custom_header_auth.dart';
import 'package:plant_market/src/modules/auth/login/widgets/login_form.dart';

class LoginPage extends BaseWidget {
  const LoginPage({super.key});

  @override
  BaseWidgetState createState() => _LoginPageState();
}

class _LoginPageState extends BaseWidgetState {
  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();
  final keyForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: context.padding(horizontal: 12),
          child: Padding(
            padding: context.padding(top: 70),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomHeaderAuthentication(),
                context.sizedBox(height: 25),
                FormLogin(
                  keyForm: keyForm,
                  phoneNumberController: phoneNumberController,
                  passwordController: passwordController,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
