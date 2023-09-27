import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:plant_market/src/core/constants.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_text_form_field.dart';

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
  @override
  Widget build(BuildContext context) {
    return Form(  
      key: widget.keyForm,
      child: Padding(
        padding: context.padding(horizontal: 50),
        child: Column(
          children: [
            // phone field
            CustomTextFormField(
              controller: widget.phoneNumberController,
              keyboardType: TextInputType.number,
              hintText: AppConstant.phoneNumberExample,
            ),
          ],
        ),
      ),
    );
  }
}
