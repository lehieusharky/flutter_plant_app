import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:plant_market/src/core/data/defines/constants/image_constant.dart';
import 'package:plant_market/src/core/extension/localization.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_loading.dart';
import 'package:plant_market/src/core/presentation/page/base_page.dart';
import 'package:plant_market/src/features/user/data/models/timeline_model.dart';
import 'package:plant_market/src/features/user/presentation/bloc/user_bloc.dart';
import 'package:plant_market/src/features/user/presentation/widgets/create_timeline_button.dart';
import 'package:plant_market/src/features/user/presentation/widgets/timeline_item.dart';

class TimeLineSection extends BaseWidget {
  final void Function() onPressed;
  const TimeLineSection({
    super.key,
    required this.onPressed,
  });

  @override
  BaseWidgetState createState() => _TimeLineSectionState();
}

class _TimeLineSectionState extends BaseWidgetState
    with AutomaticKeepAliveClientMixin {
  List<TimeLineModel> _listTimeLineModel = [];

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: BlocConsumer<UserBloc, UserState>(
        listener: (context, state) {
          if (state is UserGetListTimeLineSuccess) {
            _listTimeLineModel = state.listTimeLine;
          }
        },
        builder: (context, state) {
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
                if (_listTimeLineModel.isEmpty) ...[
                  const Center(child: CustomLoading()),
                ] else
                  Expanded(
                    child: AnimationLimiter(
                      child: ListView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.all(context.width / 30),
                        physics: const BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics()),
                        itemCount: _listTimeLineModel.length,
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
                                  image: _listTimeLineModel[index].image,
                                  title: _listTimeLineModel[index].description,
                                  description:
                                      _listTimeLineModel[index].createAt,
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
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
