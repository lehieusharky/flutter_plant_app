import 'package:flutter/material.dart';
import 'package:plant_market/src/core/extension/responsive.dart';

class BaseWidget extends StatefulWidget {
  final Widget? child;

  const BaseWidget({super.key, this.child});

  @override
  State<BaseWidget> createState() => BaseWidgetState();
}

class BaseWidgetState extends State<BaseWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: context.padding(top: 70, horizontal: 12),
        child: widget.child,
      ),
    );
  }
}
