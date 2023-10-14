import 'package:flutter/material.dart';
import 'package:plant_market/src/core/di/di_set_up.dart';
import 'package:plant_market/src/features/shake_animation/presentation/widgets/list_wheel_select_time.dart';

class CountDownWidget extends StatefulWidget {
  const CountDownWidget({super.key});

  @override
  State<CountDownWidget> createState() => _CountDownWidgetState();
}

class _CountDownWidgetState extends State<CountDownWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomListWheelSelectTime(children: _listTimeIndexValue(endIndex: 24)),
        _seperetorText(),
        CustomListWheelSelectTime(children: _listTimeIndexValue(endIndex: 59)),
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
