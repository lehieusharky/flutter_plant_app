import 'package:flutter/material.dart';
import 'package:plant_market/src/core/constants.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/core/extensions.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_text_form_field.dart';
import 'package:plant_market/src/theme/color_theme.dart';

class FormLogin extends StatefulWidget {
  final GlobalKey<FormState> keyForm;
  final TextEditingController phoneNumberController;
  final TextEditingController passwordController;
  const FormLogin({
    super.key,
    required this.keyForm,
    required this.phoneNumberController,
    required this.passwordController,
  });

  @override
  State<FormLogin> createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
  var _iconColor = colorTheme.get2DDA93;

  void _setIconColor() {
    _iconColor = colorTheme.get2DDA93;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.keyForm,
      child: Column(
        children: [
          CustomTextFormField(
            autoFocus: true,
            prefixIcon: Icon(
              Icons.phone,
              color: _iconColor,
            ),
            onTap: () => _setIconColor(),
            defaultBorderColor: colorTheme.getD2D2D2,
            focusBorderColo: colorTheme.get2DDA93,
            controller: widget.phoneNumberController,
            onSubmit: (value) => {
              _iconColor = colorTheme.getD2D2D2,
            },
            keyboardType: TextInputType.number,
            hintText: translate(context).enterYourPhoneNumber,
            backgroundColor: Colors.transparent,
            onTapOutSide: (abc) => {
              _iconColor = colorTheme.getD2D2D2,
              FocusScope.of(context).unfocus(),
            },
          ),
        ],
      ),
    );
  }
}
