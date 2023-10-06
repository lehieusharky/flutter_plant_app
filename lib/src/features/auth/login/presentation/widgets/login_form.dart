import 'package:flutter/material.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_button.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_text_form_field.dart';
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
  Color iconColor = colorTheme.get2DDA93;

  void _setIconFocus() {
    iconColor = colorTheme.get2DDA93;
  }

  void _setIconUnFocus() {
    iconColor = colorTheme.getD2D2D2;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.keyForm,
      child: Column(
        children: [
          // * phone field
          CustomTextFormField.phone(
            controller: widget.phoneNumberController,
            autoValidateMode: AutovalidateMode.always,
            onTap: () => _setIconFocus(),
            context: context,
            onSubmit: (value) => _setIconUnFocus(),
            onTapOutSide: (value) => {
              _setIconUnFocus(),
              FocusScope.of(context).unfocus(),
            },
          ),
          context.sizedBox(height: 20),

          // * send button
          CustomButton.send(
            context: context,
            onPressed: () => _sendPhoneNumber(),
          ),
        ],
      ),
    );
  }

  void _sendPhoneNumber() {}
}
