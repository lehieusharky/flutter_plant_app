import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';
import 'package:plant_market/src/core/data/datasource/local/share_preference_datasource.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_button.dart';
import 'package:plant_market/src/core/use_cases/use_case.dart';
import 'package:plant_market/src/features/auth/login/presentation/bloc/login_bloc.dart';
import 'package:plant_market/src/theme/color_theme.dart';

class OtpForm extends StatefulWidget {
  final String verificationId;
  const OtpForm({super.key, required this.verificationId});

  @override
  State<OtpForm> createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  final otpController = TextEditingController();
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final focusedBorderColor = colorTheme.get2DDA93;
    const fillColor = Color.fromRGBO(243, 246, 249, 0);
    final borderColor = sharePreference.isDarkMode()
        ? colorTheme.getFFFFFF
        : colorTheme.get6A6F7D.withOpacity(0.7);

    final defaultPinTheme = PinTheme(
      width: context.sizeWidth(60),
      height: context.sizeWidth(60),
      textStyle: TextStyle(
          fontSize: 22,
          color: sharePreference.isDarkMode()
              ? colorTheme.getFFFFFF
              : colorTheme.get6A6F7D),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: borderColor),
      ),
    );

    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Directionality(
            textDirection: TextDirection.ltr,
            child: Pinput(
              onTapOutside: (value) {
                FocusManager.instance.primaryFocus!.unfocus();
              },
              autofocus: true,
              length: 6,
              controller: otpController,
              focusNode: focusNode,
              androidSmsAutofillMethod: AndroidSmsAutofillMethod.none,
              listenForMultipleSmsOnAndroid: true,
              defaultPinTheme: defaultPinTheme,
              separatorBuilder: (index) => const SizedBox(width: 8),
              validator: (value) {
                return value != '' ? null : 'Pin is incorrect';
              },
              hapticFeedbackType: HapticFeedbackType.lightImpact,
              cursor: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 9),
                    width: 22,
                    height: 1,
                    color: focusedBorderColor,
                  ),
                ],
              ),
              focusedPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: focusedBorderColor),
                ),
              ),
              submittedPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                  color: fillColor,
                  borderRadius: BorderRadius.circular(19),
                  border: Border.all(color: focusedBorderColor),
                ),
              ),
              errorPinTheme: defaultPinTheme.copyBorderWith(
                border: Border.all(color: colorTheme.getFF6262),
              ),
            ),
          ),
          context.sizedBox(height: 20),
          // * send button
          CustomButton.send(
            context: context,
            backgroundColor: colorTheme.get2DDA93,
            onPressed: () => {
              focusNode.unfocus(),
              formKey.currentState!.validate(),
              _verifyOtp(context),
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    otpController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  void _verifyOtp(BuildContext context) {
    context.read<LoginBloc>().add(LoginVerityOtp(
            verityOtpParams: VerityOtpParams(
          verificationId: widget.verificationId,
          smsCode: otpController.text.trim(),
        )));
  }
}
