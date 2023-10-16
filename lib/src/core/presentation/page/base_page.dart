import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/background_container.dart';
import 'package:plant_market/src/theme/color_theme.dart';

class BaseWidget extends StatefulWidget {
  final Widget? child;

  const BaseWidget({super.key, this.child});

  @override
  State<BaseWidget> createState() => BaseWidgetState();
}

class BaseWidgetState extends State<BaseWidget> with TickerProviderStateMixin {
  late AnimationController _loadingController;

  @override
  void initState() {
    super.initState();
    _loadingController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
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

  Widget loadingWidget() {
    return Center(
      child: SpinKitSquareCircle(
        color: colorTheme.get2DDA93,
        size: context.sizeWidth(50),
        controller: _loadingController,
      ),
    );
  }

  void exit() {
    _loadingController.dispose();
  }
}
