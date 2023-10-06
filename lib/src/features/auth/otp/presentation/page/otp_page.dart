import 'package:flutter/material.dart';
import 'package:plant_market/src/core/presentation/page/base_page.dart';

class OTPPage extends BaseWidget {
  const OTPPage({super.key});

  @override
  BaseWidgetState createState() => _OTPPageState();
}

class _OTPPageState extends BaseWidgetState {
  @override
  Widget build(BuildContext context) {
    return const BaseWidget(
      child: Center(
        child: Text('OTP'),
      ),
    );
  }
}
