import 'package:flutter/material.dart';
import 'package:plant_market/src/core/di/di_set_up.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_text_form_field.dart';
import 'package:plant_market/src/theme/color_theme.dart';

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
        SizedBox(
          height: 100,
          width: 100,
          child: ListWheelScrollView(
            itemExtent: 50,
            clipBehavior: Clip.antiAlias,
            children: _hourValue(),
          ),
        ),
        SizedBox(
          height: 100,
          width: 100,
          child: ListWheelScrollView(
            itemExtent: 50,
            clipBehavior: Clip.antiAlias,
            children: _minuteValue(),
          ),
        ),
      ],
    );
  }

  List<Widget> _hourValue() {
    List<Widget> hourValue = [];
    for (var index = 0; index <= 24; index++) {
      hourValue.add(Text(
        '$index',
        style: theme(context).textTheme.titleMedium,
      ));
    }
    return hourValue;
  }

  List<Widget> _minuteValue() {
    List<Widget> hourValue = [];
    for (var index = 0; index <= 59; index++) {
      hourValue.add(Text(
        '$index',
        style: theme(context).textTheme.titleMedium,
      ));
    }
    return hourValue;
  }
}
