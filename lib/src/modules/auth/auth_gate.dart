import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:plant_market/src/core/presentation/page/base_page.dart';

class AuthGate extends BaseWidget {
  const AuthGate({super.key, super.child});

  @override
  BaseWidgetState createState() => _AuthGateState();
}

class _AuthGateState extends BaseWidgetState {
  void doSomeThing() {
    super.checkLoggedIn();
    log('toi la ai');
  }

  @override
  void initState() {
    super.initState();
    doSomeThing();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () => {},
          child: const Text('Click'),
        ),
      ),
    );
  }
}
