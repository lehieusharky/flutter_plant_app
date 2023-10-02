import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:plant_market/src/core/constants.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/core/extensions.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_button.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_svg.dart';
import 'package:plant_market/src/core/presentation/page/base_page.dart';
import 'package:plant_market/src/features/auth/auth_widgets/custom_header_auth.dart';
import 'package:plant_market/src/features/auth/login/bloc/login_bloc.dart';
import 'package:plant_market/src/features/auth/login/widgets/login_form.dart';
import 'package:plant_market/src/router/router_path.dart';
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
              context.go(RouterPath.dashBoard);
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
                      FormLogin(
                        keyForm: keyForm,
                        phoneNumberController: phoneNumberController,
                        passwordController: passwordController,
                      ),
                      context.sizedBox(height: 20),
                      Center(
                        child: CustomButton(
                          width: context.width,
                          height: context.sizeHeight(55),
                          onPress: () => {},
                          backgroundColor: colorTheme.get2DDA93,
                          boxShadowColor: colorTheme.getD2D2D2,
                          textStyleText:
                              AppTextTheme.getDefaultTextTheme(context)
                                  .headlineSmall,
                          borderRadius: 5,
                          child: Text(translate(context).send),
                        ),
                      ),
                      context.sizedBox(height: 20),
                      Row(
                        children: [
                          Flexible(
                            child: CustomButton(
                              width: context.width,
                              height: context.sizeHeight(50),
                              onPress: () => _loginWithGoogle(context),
                              boxShadowColor: colorTheme.getD2D2D2,
                              backgroundColor: colorTheme.getFFFFFF,
                              textStyleText:
                                  AppTextTheme.getDefaultTextTheme(context)
                                      .bodyMedium,
                              borderRadius: 5,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomSvg(path: imageConstant.googleSVG),
                                  Text(
                                    'Google',
                                    style: AppTextTheme.getDefaultTextTheme(
                                            context)
                                        .bodySmall,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          context.sizedBox(width: 20),
                          Flexible(
                            child: CustomButton(
                                width: context.width,
                                height: context.sizeHeight(50),
                                onPress: () {},
                                boxShadowColor: colorTheme.getD2D2D2,
                                backgroundColor: colorTheme.getFFFFFF,
                                textStyleText:
                                    AppTextTheme.getDefaultTextTheme(context)
                                        .bodyMedium,
                                borderRadius: 5,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CustomSvg(
                                      path: imageConstant.appleSVG,
                                      width: context.sizeWidth(45),
                                    ),
                                    Text(
                                      'Apple',
                                      style: AppTextTheme.getDefaultTextTheme(
                                              context)
                                          .bodySmall,
                                    ),
                                  ],
                                )),
                          ),
                        ],
                      ),
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
