import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:plant_market/src/core/data/defines/constants/app_constant.dart';
import 'package:plant_market/src/core/extension/localization.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/core/extension/string_ext.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_button.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_text_form_field.dart';
import 'package:plant_market/src/core/use_cases/use_case.dart';
import 'package:plant_market/src/features/auth/login/presentation/bloc/login_bloc.dart';
import 'package:plant_market/src/router/router_path.dart';
import 'package:plant_market/src/theme/color_theme.dart';

class FormLogin extends StatefulWidget {
  const FormLogin({super.key});

  @override
  State<FormLogin> createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
  Color _iconColor = colorTheme.getD2D2D2;
  final _keyForm = GlobalKey<FormState>();
  final _phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _keyForm,
      child: Column(
        children: [
          // * phone field
          CustomTextFormField.phone(
            prefixIcon: _prefixIcon(),
            controller: _phoneNumberController,
            autoValidateMode: AutovalidateMode.onUserInteraction,
            onTap: () => _setIconColor(color: colorTheme.get2DDA93),
            context: context,
            validator: (phoneNumber) => _phoneNumberValidation(
                phoneNumber: phoneNumber, context: context),
            onSubmit: (value) => _setIconColor(color: colorTheme.getD2D2D2),
            onTapOutSide: (value) => {
              _setIconColor(color: colorTheme.get6A6F7D),
              FocusManager.instance.primaryFocus!.unfocus()
            },
          ),

          context.sizedBox(height: 20),
          // * send button
          CustomButton.send(
            context: context,
            onPressed: () => _phoneNumberFormValidation(context),
          ),
        ],
      ),
    );
  }

  void _setIconColor({required Color color}) {
    setState(() {
      _iconColor = color;
    });
  }

  Widget _prefixIcon() {
    return Icon(
      FontAwesomeIcons.phone,
      color: _iconColor,
    );
  }

  String? _phoneNumberValidation({
    String? phoneNumber,
    required BuildContext context,
  }) {
    String? errorValidation;
    if (phoneNumber == "") {
      errorValidation = translate(context).pleaseEnterYourPhoneNumber;
    } else {
      errorValidation = phoneNumber!.errorPhoneValidation(context);
    }

    if (errorValidation != null) {
      _setIconColor(color: colorTheme.getFF6262);
    }
    return errorValidation;
  }

  void _navigateToOtpPage(BuildContext context, String verificationId) {
    return context.go(RouterPath.otpPage, extra: {
      AppConstant.verificationID: verificationId,
    });
  }

  void _sendOTP(BuildContext context) {
    context.read<LoginBloc>().add(
          LoginSentOtp(
            sentOtpParams: SentOtpParams(
              phoneNumber: _phoneNumberController.text.trim(),
              pushToOtp: (verificationId) =>
                  _navigateToOtpPage(context, verificationId),
            ),
          ),
        );
  }

  void _phoneNumberFormValidation(BuildContext context) {
    if (_keyForm.currentState?.validate() ?? false) {
      _sendOTP(context);
    }
  }

  @override
  void dispose() {
    _phoneNumberController.dispose();
    super.dispose();
  }
}
