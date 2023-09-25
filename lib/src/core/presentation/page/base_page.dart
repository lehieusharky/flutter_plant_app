import 'dart:developer';

import 'package:flutter/material.dart';

class BaseWidget extends StatefulWidget {
  final Widget? child;

  const BaseWidget({super.key, this.child});

  @override
  State<BaseWidget> createState() => BaseWidgetState();
}

class BaseWidgetState extends State<BaseWidget> {
  bool isLoggedIn = false;

  void checkLoggedIn() {
    log('callllled');
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: widget.child ?? const SizedBox(),
      ),
    );
  }
}
