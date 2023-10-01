import 'package:flutter/material.dart';

class CustomBorder extends StatelessWidget {
  final Widget child;
  final double? width;
  final double? height;

  const CustomBorder({
    super.key,
    required this.child,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 15,
            offset: const Offset(1, 2), // changes position of shadow
          ),
        ],
      ),
      child: child,
    );
  }
}
