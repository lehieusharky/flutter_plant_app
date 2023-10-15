import 'package:flutter/material.dart';
import 'package:plant_market/src/core/di/di_set_up.dart';
import 'package:plant_market/src/features/shake_animation/presentation/widgets/list_wheel_select_time.dart';

class CountDownWidget extends StatefulWidget {
  final ScrollController hourScrollController;
  final ScrollController minuteScrollController;
  final void Function(int)? onSelectedHourItem;
  final void Function(int)? onSelectedMinuteItem;

  const CountDownWidget({
    super.key,
    required this.hourScrollController,
    required this.minuteScrollController,
    this.onSelectedHourItem,
    this.onSelectedMinuteItem,
  });

  @override
  State<CountDownWidget> createState() => _CountDownWidgetState();
}

class _CountDownWidgetState extends State<CountDownWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomListWheelSelectTime(
          scrollController: widget.hourScrollController,
          onSelectedItem: widget.onSelectedHourItem,
          children: _listTimeIndexValue(endIndex: 24),
        ),
        _seperetorText(),
        CustomListWheelSelectTime(
          scrollController: widget.minuteScrollController,
          onSelectedItem: widget.onSelectedMinuteItem,
          children: _listTimeIndexValue(endIndex: 59),
        ),
      ],
    );
  }

  List<Widget> _listTimeIndexValue({required int endIndex, int? beginIndex}) {
    List<Widget> hourValue = [];
    for (var index = beginIndex ?? 0; index <= endIndex; index++) {
      hourValue.add(
        Text(index <= 9 ? '0$index' : '$index',
            style: theme(context).textTheme.headlineMedium!.copyWith(
                  fontSize: 55,
                  fontWeight: FontWeight.w100,
                )),
      );
    }
    return hourValue;
  }

  Widget _seperetorText() {
    return Text(
      ':',
      style: theme(context).textTheme.headlineMedium!.copyWith(fontSize: 55),
    );
  }
}
