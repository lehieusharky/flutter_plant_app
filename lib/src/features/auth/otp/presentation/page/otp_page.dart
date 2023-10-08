import 'dart:async';

import 'package:flutter/material.dart';
import 'package:plant_market/src/core/extension/localization.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_back_button.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_header_auth.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/toggle_language_button.dart';
import 'package:plant_market/src/core/presentation/page/base_page.dart';
import 'package:plant_market/src/features/auth/otp/presentation/widgets/otp_form.dart';

class OTPPage extends BaseWidget {
  const OTPPage({super.key});

  @override
  BaseWidgetState createState() => _OTPPageState();
}

class _OTPPageState extends BaseWidgetState {
  int _countDown = 60;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_countDown > 0) {
          _countDown--;
        } else {
          _timer.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomBackButton(),
          CustomHeaderAuthentication(
            title: translate(context).otpVerification,
            subTitle:
                '${translate(context).pleaseVerifyWithin} ${_countDown}s.',
          ),
          context.sizedBox(height: 25),
          const Center(child: OtpForm()),
        ],
      ),
    );
  }
}
