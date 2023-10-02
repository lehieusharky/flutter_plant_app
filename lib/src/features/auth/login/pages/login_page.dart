import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_button.dart';
import 'package:plant_market/src/core/presentation/page/base_page.dart';
import 'package:plant_market/src/features/auth/auth_widgets/custom_header_auth.dart';
import 'package:plant_market/src/features/auth/login/bloc/login_bloc.dart';
import 'package:plant_market/src/theme/color_theme.dart';
import 'package:plant_market/src/theme/font_theme.dart';

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
      child: BlocProvider(
        create: (context) => LoginBloc(),
        child: BlocConsumer<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginFailure) {
              log('error ${state.message}');
            }
            if (state is LoginSuccess) {
              context.go('/home');
            }
          },
          builder: (context, state) {
            return Scaffold(
              body: Padding(
                padding: context.padding(horizontal: 12),
                child: Padding(
                  padding: context.padding(top: 70),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomHeaderAuthentication(),
                      context.sizedBox(height: 25),
                      Center(
                        child: CustomButton(
                          onPress: () => _loginWithGoogle(context),
                          backgroundColor: colorTheme.get36455A,
                          textStyleText:
                              AppTextTheme.getDefaultTextTheme(context)
                                  .bodyMedium,
                          borderRadius: 1,
                          child: const Text('as1'),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _loginWithGoogle(BuildContext context) {
    context.read<LoginBloc>().add(LoginWithGoogle());
  }
}
