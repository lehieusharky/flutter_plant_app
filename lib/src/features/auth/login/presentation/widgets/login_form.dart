import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:plant_market/src/core/data/defines/constants/app_constant.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_button.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_text_form_field.dart';
import 'package:plant_market/src/core/use_cases/use_case.dart';
import 'package:plant_market/src/features/auth/login/presentation/bloc/login_bloc.dart';
import 'package:plant_market/src/router/router_path.dart';
import 'package:plant_market/src/theme/color_theme.dart';

class FormLogin extends StatefulWidget {
  final GlobalKey<FormState> keyForm;
  final TextEditingController phoneNumberController;

  const FormLogin({
    super.key,
    required this.keyForm,
    required this.phoneNumberController,
  });

  @override
  State<FormLogin> createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
  Color _iconColor = colorTheme.getD2D2D2;

  void _setIconFocus() {
    setState(() {
      _iconColor = colorTheme.get2DDA93;
    });
  }

  void _setIconUnFocus() {
    setState(() {
      _iconColor = colorTheme.getD2D2D2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.keyForm,
      child: Column(
        children: [
          // * phone field
          CustomTextFormField.phone(
            prefixIcon: Icon(
              FontAwesomeIcons.phone,
              color: _iconColor,
            ),
            controller: widget.phoneNumberController,
            autoValidateMode: AutovalidateMode.always,
            onTap: () => _setIconFocus(),
            context: context,
            validator: (value) {
              return null;
            },
            onSubmit: (value) => {
              _setIconUnFocus(),
            },
            onTapOutSide: (value) => {
              _setIconUnFocus(),
              FocusManager.instance.primaryFocus!.unfocus()
            },
          ),

          context.sizedBox(height: 20),
          // * send button
          CustomButton.send(
            context: context,
            onPressed: () => _sendPhoneNumber(context),
          ),
        ],
      ),
    );
  }

  void _sendPhoneNumber(BuildContext context) {
    if (widget.keyForm.currentState?.validate() ?? false) {
      context.read<LoginBloc>().add(LoginSentOtp(
            sentOtpParams: SentOtpParams(
              phoneNumber: widget.phoneNumberController.text.trim(),
              pushToOtp: (verificationId) =>
                  _nativateToOtpPage(context, verificationId),
            ),
          ));
    }
  }

  void _nativateToOtpPage(BuildContext context, String verificationId) {
    return context.go(RouterPath.otpPage, extra: {
      AppConstant.verificationID: verificationId,
    });
  }
}
