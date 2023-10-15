import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/theme/color_theme.dart';

class CountDownRingWidget extends StatefulWidget {
  final CountDownController countDownController;
  const CountDownRingWidget({super.key, required this.countDownController});

  @override
  State<CountDownRingWidget> createState() => _CountDownRingWidgetState();
}

class _CountDownRingWidgetState extends State<CountDownRingWidget> {
  @override
  Widget build(BuildContext context) {
    return CircularCountDownTimer(
      duration: 30,
      initialDuration: 0,
      controller: widget.countDownController,
      width: context.sizeWidth(310),
      height: context.sizeHeight(310),
      ringColor: Colors.transparent,
      fillColor: colorTheme.get2DDA93,
      strokeWidth: context.sizeWidth(15),
      strokeCap: StrokeCap.round,
      isReverse: false,
      isReverseAnimation: true,
      autoStart: false,
      onStart: () {},
      onComplete: () {},
      onChange: (String timeStamp) {},
      timeFormatterFunction: (defaultFormatterFunction, duration) {
        if (duration.inSeconds == 0) {
          return "Start";
        } else {
          return Function.apply(defaultFormatterFunction, [duration]);
        }
      },
    );
  }
}
