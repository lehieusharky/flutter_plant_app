import 'package:flutter/material.dart';
import 'package:plant_market/src/core/di/part_di.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/background_container.dart';

class BaseWidget extends StatefulWidget {
  final Widget? child;

  const BaseWidget({super.key, this.child});

  @override
  State<BaseWidget> createState() => BaseWidgetState();
}

class BaseWidgetState extends State<BaseWidget> with TickerProviderStateMixin {
  bool isNotLoggedIn() {
    return firebaseAuth.currentUser == null ? true : false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackGroundContainer(),
          Padding(
            padding: context.padding(top: 60, horizontal: 12),
            child: widget.child,
          ),
        ],
      ),
    );
  }
}
