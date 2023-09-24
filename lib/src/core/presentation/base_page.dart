import 'dart:developer';

import 'package:flutter/material.dart';

class BaseWidget extends StatefulWidget {
  final Widget? child;

  const BaseWidget({super.key, this.child});

  @override
  State<BaseWidget> createState() => BaseWidgetState();

  static BaseWidgetState of(BuildContext context) {
    return context.findAncestorStateOfType<BaseWidgetState>()!;
  }
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
    return widget.child ?? const SizedBox();
  }
}
