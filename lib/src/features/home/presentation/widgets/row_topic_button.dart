import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_market/src/core/data/defines/constants/image_constant.dart';
import 'package:plant_market/src/core/extension/localization.dart';
import 'package:plant_market/src/features/home/data/enum/topic_symbol.dart';
import 'package:plant_market/src/features/home/presentation/bloc/home_page_bloc.dart';
import 'package:plant_market/src/features/home/presentation/widgets/part_home_page_widget.dart';

class RowTopicButton extends StatefulWidget {
  const RowTopicButton({super.key});

  @override
  State<RowTopicButton> createState() => _RowTopicButtonState();
}

class _RowTopicButtonState extends State<RowTopicButton> {
  TopicSymbol _isChoosedTopic = TopicSymbol.general;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomePageBloc, HomePageState>(
      listener: (context, state) {
        if (state is HomePageChangeTopicSuccess) {
          _isChoosedTopic = state.topicSymbol;
        }
      },
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TopicButton(
                onPressed: () => _changeTopic(topicSymbol: TopicSymbol.general),
                title: translate(context).general,
                pathIcon: imageConstant.leavesSVG,
                isChoosed: _isChoosedTopic,
                topicSymbol: TopicSymbol.general),
            TopicButton(
              onPressed: () => _changeTopic(topicSymbol: TopicSymbol.community),
              title: translate(context).community,
              pathIcon: imageConstant.communitySVG,
              isChoosed: _isChoosedTopic,
              topicSymbol: TopicSymbol.community,
            ),
            TopicButton(
              onPressed: () => _changeTopic(topicSymbol: TopicSymbol.map),
              title: translate(context).map,
              pathIcon: imageConstant.mapSVG,
              isChoosed: _isChoosedTopic,
              topicSymbol: TopicSymbol.map,
            ),
          ],
        );
      },
    );
  }

  void _changeTopic({required TopicSymbol topicSymbol}) {
    context
        .read<HomePageBloc>()
        .add(HomePageChangetTopic(topicSymbol: topicSymbol));
  }
}
