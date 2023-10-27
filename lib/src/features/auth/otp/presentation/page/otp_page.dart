import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:plant_market/src/core/extension/localization.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_back_button.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_header_auth.dart';
import 'package:plant_market/src/core/presentation/page/base_page.dart';
import 'package:plant_market/src/features/auth/login/presentation/bloc/login_bloc.dart';
import 'package:plant_market/src/features/auth/otp/presentation/widgets/otp_form.dart';
import 'package:plant_market/src/router/router_path.dart';

class OTPPage extends BaseWidget {
  final String verificationId;

  const OTPPage({
    Key? key,
    required this.verificationId,
  }) : super(key: key);

  @override
  BaseWidgetState createState() => _OTPPageState();
}

class _OTPPageState extends BaseWidgetState {
  int _countDown = 60;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    final String verificationId = (widget as OTPPage).verificationId;
    log('id idddd: $verificationId');
    _timer = _coutDownTimer();
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      child: BlocProvider(
        create: (context) => LoginBloc(),
        child: BlocConsumer<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              context.go(RouterPath.dashBoard);
            }
          },
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomBackButton(),
                context.sizedBox(height: 25),
                CustomHeaderAuthentication(
                  title: translate(context).otpVerification,
                  subTitle:
                      '${translate(context).pleaseVerifyWithin} ${_countDown}s.',
                ),
                context.sizedBox(height: 25),
                Center(
                    child: OtpForm(
                  verificationId: (widget as OTPPage).verificationId,
                )),
              ],
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  Timer _coutDownTimer() {
    return Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_countDown > 0) {
          _countDown--;
        } else {
          _timer.cancel();
        }
      });
    });
  }
}
