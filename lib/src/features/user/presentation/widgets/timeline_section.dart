import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:plant_market/src/core/data/defines/constants/image_constant.dart';
import 'package:plant_market/src/core/extension/localization.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/core/presentation/page/base_page.dart';
import 'package:plant_market/src/features/user/data/models/timeline_model.dart';
import 'package:plant_market/src/features/user/presentation/widgets/create_timeline_button.dart';
import 'package:plant_market/src/features/user/presentation/widgets/timeline_item.dart';

class TimeLineSection extends BaseWidget {
  final void Function() onPressed;
  final List<TimeLineModel> listTimeLineModel;
  const TimeLineSection({
    super.key,
    required this.onPressed,
    required this.listTimeLineModel,
  });

  @override
  BaseWidgetState createState() => _TimeLineSectionState();
}

class _TimeLineSectionState extends BaseWidgetState
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Padding(
      padding: context.padding(horizontal: 12),
      child: Column(
        children: [
          context.sizedBox(height: 15),
          CreateTimelineButton.fullWidth(
            context: context,
            onPressed: (widget as TimeLineSection).onPressed,
            title: translate(context).recordPlantProcess,
            iconPath: imageConstant.cameraSVG,
          ),
          if ((widget as TimeLineSection).listTimeLineModel.isEmpty) ...[
            const SizedBox()
          ] else
            Expanded(
              child: AnimationLimiter(
                child: ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.all(context.width / 30),
                  physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  itemCount:
                      (widget as TimeLineSection).listTimeLineModel.length,
                  itemBuilder: (BuildContext context, int index) {
                    return AnimationConfiguration.staggeredList(
                      position: index,
                      delay: const Duration(milliseconds: 100),
                      child: SlideAnimation(
                        duration: const Duration(milliseconds: 2500),
                        curve: Curves.fastLinearToSlowEaseIn,
                        child: FadeInAnimation(
                          curve: Curves.fastLinearToSlowEaseIn,
                          duration: const Duration(milliseconds: 2500),
                          child: TimeLineItem(
                            image: (widget as TimeLineSection)
                                .listTimeLineModel
                                .reversed
                                .toList()[index]
                                .image,
                            title: (widget as TimeLineSection)
                                .listTimeLineModel
                                .reversed
                                .toList()[index]
                                .description,
                            description: (widget as TimeLineSection)
                                .listTimeLineModel
                                .reversed
                                .toList()[index]
                                .createAt,
                            index: index,
                            isFirstItem: (widget as TimeLineSection)
                                    .listTimeLineModel
                                    .length ==
                                index + 1,
                            lengthOfListTimeLine: (widget as TimeLineSection)
                                .listTimeLineModel
                                .length,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
