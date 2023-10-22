import 'package:flutter/material.dart';
import 'package:plant_market/src/core/di/part_di.dart';
import 'package:plant_market/src/features/shake_animation/presentation/widgets/list_wheel_select_time.dart';

class CountDownWidget extends StatefulWidget {
  final ScrollController hourScrollController;
  final ScrollController minuteScrollController;
  final void Function(int)? onMinuteSelected;

  const CountDownWidget({
    super.key,
    required this.hourScrollController,
    required this.minuteScrollController,
    this.onMinuteSelected,
  });

  @override
  State<CountDownWidget> createState() => _CountDownWidgetState();
}

class _CountDownWidgetState extends State<CountDownWidget> {
  int hourMax = 99;
  int minuteMax = 59;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomListWheelSelectTime(
          scrollController: widget.hourScrollController,
          onSelectedItem: (hourValue) {},
          children: _listTimeIndexValue(endIndex: hourMax),
        ),
        _seperetorText(),
        CustomListWheelSelectTime(
          scrollController: widget.minuteScrollController,
          onSelectedItem: widget.onMinuteSelected,
          children: _listTimeIndexValue(endIndex: minuteMax),
        ),
      ],
    );
  }

  List<Widget> _listTimeIndexValue({required int endIndex, int? beginIndex}) {
    List<Widget> hourValue = [];
    for (var index = beginIndex ?? 0; index <= endIndex; index++) {
      hourValue.add(
        Text(
          index <= 9 ? '0$index' : '$index',
          style: theme(context).textTheme.headlineMedium!.copyWith(
                fontSize: 70,
                fontWeight: FontWeight.w100,
              ),
        ),
      );
    }
    return hourValue;
  }

  Widget _seperetorText() {
    return Text(
      ':',
      style: theme(context).textTheme.headlineMedium!.copyWith(fontSize: 70),
    );
  }
}
