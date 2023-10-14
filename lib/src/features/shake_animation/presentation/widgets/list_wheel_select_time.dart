import 'package:flutter/material.dart';

class CustomListWheelSelectTime extends StatefulWidget {
  final List<Widget> children;
  const CustomListWheelSelectTime({super.key, required this.children});

  @override
  State<CustomListWheelSelectTime> createState() =>
      _CustomListWheelSelectTimeState();
}

class _CustomListWheelSelectTimeState extends State<CustomListWheelSelectTime> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100 ,
      width: 100,
      child: ListWheelScrollView(
        itemExtent: 80,
        scrollBehavior: const ScrollBehavior(),
        clipBehavior: Clip.antiAlias,
        useMagnifier: true,
        children: widget.children,
      ),
    );
  }
}
