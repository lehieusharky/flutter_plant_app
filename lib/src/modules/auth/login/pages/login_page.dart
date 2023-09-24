import 'package:flutter/material.dart';
import 'package:plant_market/src/core/extensions.dart';
import 'package:plant_market/src/core/presentation/page/base_page.dart';

class LoginPage extends BaseWidget {
  const LoginPage({super.key});

  @override
  BaseWidgetState createState() => _LoginPageState();
}

class _LoginPageState extends BaseWidgetState {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Text(translate(context).helloWorld),
          ],
        ),
      ),
    );
  }
}
