import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_market/src/core/constants.dart';
import 'package:plant_market/src/features/home/bloc/home_page_bloc.dart';
import 'package:plant_market/src/features/home/widgets/topic_button.dart';
import 'package:plant_market/src/theme/color_theme.dart';

class RowTopicButton extends StatefulWidget {
  final int isChoosed;
  const RowTopicButton({super.key, required this.isChoosed});

  @override
  State<RowTopicButton> createState() => _RowTopicButtonState();
}

class _RowTopicButtonState extends State<RowTopicButton> {
  final topicSymbols = [1, 2, 3];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TopicButton(
          onPressed: () => _changeTopic(index: topicSymbols[0]),
          backgroundColor: colorTheme.get2cd992,
          title: 'IDENTIFY',
          pathIcon: imageConstant.leavesSVG,
          isChoosed: widget.isChoosed,
          defaultIndex: topicSymbols[0],
        ),
        TopicButton(
          onPressed: () => _changeTopic(index: topicSymbols[1]),
          backgroundColor: colorTheme.get2cd992,
          title: 'Communiy',
          pathIcon: imageConstant.leavesSVG,
          isChoosed: widget.isChoosed,
          defaultIndex: topicSymbols[1],
        ),
        TopicButton(
          onPressed: () => _changeTopic(index: topicSymbols[2]),
          backgroundColor: colorTheme.get2cd992,
          title: 'ABC_XYZ',
          pathIcon: imageConstant.leavesSVG,
          isChoosed: widget.isChoosed,
          defaultIndex: topicSymbols[2],
        ),
      ],
    );
  }

  void _changeTopic({required int index}) {
    context.read<HomePageBloc>().add(HomePageChangetTopic(index: index));
  }
}
