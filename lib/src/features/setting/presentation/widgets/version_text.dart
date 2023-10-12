import 'package:flutter/cupertino.dart';
import 'package:plant_market/src/core/di/di_set_up.dart';
import 'package:plant_market/src/core/extension/localization.dart';

class VersionText extends StatelessWidget {
  const VersionText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      '${translate(context).version} 1.0.0',
      style: theme(context).textTheme.titleSmall,
    );
  }
}
