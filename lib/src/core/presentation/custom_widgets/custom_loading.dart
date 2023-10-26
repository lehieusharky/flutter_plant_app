import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/theme/color_theme.dart';

class CustomLoading extends StatefulWidget {
  const CustomLoading({super.key});

  @override
  State<CustomLoading> createState() => _CustomLoadingState();
}

class _CustomLoadingState extends State<CustomLoading>
    with TickerProviderStateMixin {
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
    return Center(
      child: SpinKitSquareCircle(
        color: colorTheme.get2DDA93,
        size: context.sizeWidth(50),
        controller: _loadingController,
      ),
    );
  }

  @override
  void dispose() {
    _loadingController.dispose();
    super.dispose();
  }
}
