import 'package:flutter/material.dart';
import 'package:plant_market/src/core/extension/responsive.dart';

class CustomListWheelSelectTime extends StatefulWidget {
  final List<Widget> children;
  final ScrollController scrollController;
  final void Function(int)? onSelectedItem;
  const CustomListWheelSelectTime({
    super.key,
    required this.children,
    required this.scrollController,
    this.onSelectedItem,
  });

  @override
  State<CustomListWheelSelectTime> createState() =>
      _CustomListWheelSelectTimeState();
}

class _CustomListWheelSelectTimeState extends State<CustomListWheelSelectTime> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.sizeHeight(90),
      width: context.sizeWidth(100),
      child: ListWheelScrollView.useDelegate(
        itemExtent: context.sizeHeight(80),
        controller: widget.scrollController,
        scrollBehavior: const ScrollBehavior(),
        physics: const FixedExtentScrollPhysics(),
        diameterRatio: 2,
        clipBehavior: Clip.antiAlias,
        useMagnifier: true,
        onSelectedItemChanged: widget.onSelectedItem,
        childDelegate:
            ListWheelChildLoopingListDelegate(children: widget.children),
      ),
    );
  }
}
