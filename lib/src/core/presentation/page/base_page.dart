import 'package:flutter/material.dart';
import 'package:plant_market/src/core/data/defines/constants/image_constant.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_lottie.dart';

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
        padding: context.padding(top: 60, horizontal: 12),
        child: widget.child,
      ),
    );
  }

  Widget loadingWidget() {
    return Center(
      child: CustomLottie(
        path: imageConstant.loadingLottie,
        width: context.width,
        height: context.height,
      ),
    );
  }
}
