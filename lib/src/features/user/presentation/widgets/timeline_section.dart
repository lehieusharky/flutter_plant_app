import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_market/src/core/di/part_di.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/features/user/data/models/time_line_model.dart';
import 'package:plant_market/src/features/user/presentation/bloc/user_bloc.dart';
import 'package:plant_market/src/features/user/presentation/widgets/time_line_item.dart';

class TimeLineSection extends StatefulWidget {
  const TimeLineSection({super.key});

  @override
  State<TimeLineSection> createState() => _TimeLineSectionState();
}

class _TimeLineSectionState extends State<TimeLineSection>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
          child: ListView.builder(
              itemCount: 20,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Text(
                  '$index',
                  style: theme(context).textTheme.displayMedium,
                );
              })),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
