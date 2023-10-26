import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_market/src/core/data/defines/constants/image_constant.dart';
import 'package:plant_market/src/core/di/part_di.dart';
import 'package:plant_market/src/core/extension/localization.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_modal.dart';
import 'package:plant_market/src/features/home/data/enum/topic_symbol.dart';
import 'package:plant_market/src/features/home/presentation/bloc/home_page_bloc.dart';
import 'package:plant_market/src/features/home/presentation/widgets/part_home_page_widget.dart';

class RowTopicButton extends StatefulWidget {
  final ScrollController pageScrollController;
  const RowTopicButton({super.key, required this.pageScrollController});

  @override
  State<RowTopicButton> createState() => _RowTopicButtonState();
}

class _RowTopicButtonState extends State<RowTopicButton> {
  TopicSymbol _isChoosedTopic = TopicSymbol.init;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomePageBloc, HomePageState>(
      listener: (context, state) {
        if (state is HomePageChangeTopicSuccess) {
          _isChoosedTopic = state.topicSymbol;
          widget.pageScrollController.animateTo(240,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut);
        }
      },
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TopicButton(
                onPressed: () {
                  _showPlantIdentify(context);
                  _changeTopic(topicSymbol: TopicSymbol.identification);
                },
                title: translate(context).identify,
                pathIcon: imageConstant.cameraSVG,
                isChoosed: _isChoosedTopic,
                topicSymbol: TopicSymbol.identification),
            TopicButton(
              onPressed: () {
                _showCreateCommunityPost(context);
                _changeTopic(topicSymbol: TopicSymbol.community);
              },
              title: translate(context).community,
              pathIcon: imageConstant.communitySVG,
              isChoosed: _isChoosedTopic,
              topicSymbol: TopicSymbol.community,
            ),
            TopicButton(
              onPressed: () {
                _showImageGalerry(context);
                _changeTopic(topicSymbol: TopicSymbol.gallery);
              },
              title: translate(context).gallery,
              pathIcon: imageConstant.gallerySVG,
              isChoosed: _isChoosedTopic,
              topicSymbol: TopicSymbol.gallery,
            ),
          ],
        );
      },
    );
  }

  void _showImageGalerry(BuildContext context) {
    CustomModal.baseModal(
      context: context,
      height: context.height * 0.8,
      child: Text(
        'Image galerry',
        style: theme(context).textTheme.titleMedium,
      ),
    );
  }

  void _showCreateCommunityPost(BuildContext context) {
    CustomModal.baseModal(
      context: context,
      height: context.height * 0.8,
      child: Text(
        'Community post',
        style: theme(context).textTheme.titleMedium,
      ),
    );
  }

  void _showPlantIdentify(BuildContext context) {
    CustomModal.baseModal(
      context: context,
      height: context.height * 0.8,
      child: Text(
        'Community post',
        style: theme(context).textTheme.titleMedium,
      ),
    );
  }

  void _changeTopic({required TopicSymbol topicSymbol}) {
    context
        .read<HomePageBloc>()
        .add(HomePageChangetTopic(topicSymbol: topicSymbol));
  }
}
