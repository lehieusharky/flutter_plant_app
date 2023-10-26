import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_market/src/core/data/defines/constants/image_constant.dart';
import 'package:plant_market/src/core/di/part_di.dart';
import 'package:plant_market/src/core/extension/localization.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_modal.dart';
import 'package:plant_market/src/features/home/data/enum/topic_symbol.dart';
import 'package:plant_market/src/features/home/presentation/bloc/home_page_bloc.dart';
import 'package:plant_market/src/features/home/presentation/widgets/create_community_post_modal.dart';
import 'package:plant_market/src/features/home/presentation/widgets/gallery_modal.dart';
import 'package:plant_market/src/features/home/presentation/widgets/part_home_page_widget.dart';
import 'package:plant_market/src/features/home/presentation/widgets/plant_identity_modal.dart';

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
                  _showTopicModal(
                    context: context,
                    child: const PlantIdentifyModal(),
                  );
                  _changeTopic(topicSymbol: TopicSymbol.identification);
                },
                title: translate(context).identify,
                pathIcon: imageConstant.cameraSVG,
                isChoosed: _isChoosedTopic,
                topicSymbol: TopicSymbol.identification),
            TopicButton(
              onPressed: () {
                _showTopicModal(
                  context: context,
                  child: const CreateCommunityPostModal(),
                );
                _changeTopic(topicSymbol: TopicSymbol.community);
              },
              title: translate(context).community,
              pathIcon: imageConstant.communitySVG,
              isChoosed: _isChoosedTopic,
              topicSymbol: TopicSymbol.community,
            ),
            TopicButton(
              onPressed: () {
                _showTopicModal(context: context, child: const GalleryModal());
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

  void _showTopicModal({required BuildContext context, required Widget child}) {
    CustomModal.baseModal(
      context: context,
      height: context.height * 0.8,
      child: child,
    );
  }

  void _changeTopic({required TopicSymbol topicSymbol}) {
    context
        .read<HomePageBloc>()
        .add(HomePageChangetTopic(topicSymbol: topicSymbol));
  }
}
