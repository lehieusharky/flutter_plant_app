import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomLottie extends StatefulWidget {
  final Animation<double>? controller;
  final String path;
  final double? width;
  final double? height;

  const CustomLottie({
    super.key,
    this.controller,
    required this.path,
    this.width,
    this.height,
  });

  @override
  State<CustomLottie> createState() => _CustomLottieState();
}

class _CustomLottieState extends State<CustomLottie> {
  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      widget.path,
      controller: widget.controller,
      width: widget.width,
      height: widget.height,
      onLoaded: (composition) {},
    );
  }
}
