import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_market/src/core/data/defines/constants/image_constant.dart';
import 'package:plant_market/src/core/extension/localization.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_background.dart';
import 'package:plant_market/src/features/home/data/enum/topic_symbol.dart';
import 'package:plant_market/src/features/home/presentation/bloc/home_page_bloc.dart';
import 'package:plant_market/src/features/home/presentation/widgets/part_home_page_widget.dart';

class RowTopicButton extends StatefulWidget {
  final ScrollController pageScrollController;
  final void Function() onIndetifyPressed;
  final void Function() onCommunityPressed;
  final void Function() onGalleryPressed;

  const RowTopicButton({
    super.key,
    required this.pageScrollController,
    required this.onIndetifyPressed,
    required this.onCommunityPressed,
    required this.onGalleryPressed,
  });

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
          _handleOnChangeTopicSuccess(state);
        }
      },
      builder: (context, state) {
        return Padding(
          padding: context.padding(horizontal: 50),
          child: Custombackground(
            width: context.width,
            height: context.sizeHeight(100),
            child: Padding(
              padding: context.padding(horizontal: 24, vertical: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TopicButton(
                      onPressed: widget.onIndetifyPressed,
                      title: translate(context).identify,
                      pathIcon: imageConstant.cameraSVG,
                      isChoosed: _isChoosedTopic,
                      topicSymbol: TopicSymbol.identification),
                  TopicButton(
                    onPressed: widget.onCommunityPressed,
                    title: translate(context).community,
                    pathIcon: imageConstant.communitySVG,
                    isChoosed: _isChoosedTopic,
                    topicSymbol: TopicSymbol.community,
                  ),
                  TopicButton(
                    onPressed: widget.onGalleryPressed,
                    title: translate(context).gallery,
                    pathIcon: imageConstant.gallerySVG,
                    isChoosed: _isChoosedTopic,
                    topicSymbol: TopicSymbol.gallery,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _handleOnChangeTopicSuccess(HomePageChangeTopicSuccess state) {
    _isChoosedTopic = state.topicSymbol;
    widget.pageScrollController.animateTo(305,
        duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
  }
}
