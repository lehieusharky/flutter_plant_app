import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:plant_market/src/core/data/defines/constants/image_constant.dart';
import 'package:plant_market/src/core/extension/localization.dart';
import 'package:plant_market/src/features/user/data/enums/user_page_section.dart';
import 'package:plant_market/src/features/user/presentation/bloc/user_bloc.dart';
import 'package:plant_market/src/features/user/presentation/widgets/section_button.dart';
import 'package:plant_market/src/theme/color_theme.dart';

class DrawerUserPage extends StatelessWidget {
  final TabController tabController;
  const DrawerUserPage({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    List<SectionTopicButton> listSectionButton = [
      SectionTopicButton(
        icon: imageConstant.timeLineSvg,
        title: translate(context).timeLine,
        onPressed: () => _onDrawerPressed(
          context: context,
          index: 0,
          userPageSection: UserPageSection.timeLine,
        ),
        userPageSection: UserPageSection.timeLine,
      ),
      SectionTopicButton(
        icon: imageConstant.reminderSvg,
        title: translate(context).reminder,
        onPressed: () => _onDrawerPressed(
            context: context,
            index: 1,
            userPageSection: UserPageSection.reminder),
        userPageSection: UserPageSection.reminder,
      ),
      SectionTopicButton(
        icon: imageConstant.chartSvg,
        title: 'Graph',
        onPressed: () => _onDrawerPressed(
          context: context,
          index: 2,
          userPageSection: UserPageSection.graph,
        ),
        userPageSection: UserPageSection.graph,
      ),
    ];
    return BlocSelector<UserBloc, UserState, UserPageSection>(
      selector: (state) {
        if (state is UserChooseSectionSuccess) {
          return state.userPageSection;
        }
        return UserPageSection.timeLine;
      },
      builder: (context, state) {
        return Drawer(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            child: ListView(
              children: [
                DrawerHeader(
                    decoration: BoxDecoration(color: colorTheme.get2DDA93),
                    child: listSectionButton
                        .where((section) => section.userPageSection == state)
                        .first),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: listSectionButton
                      .where((section) => section.userPageSection != state)
                      .toList(),
                )
              ],
            ));
      },
    );
  }

  void _onDrawerPressed({
    required BuildContext context,
    required int index,
    required UserPageSection userPageSection,
  }) {
    tabController.animateTo(index);
    context
        .read<UserBloc>()
        .add(UserChooseSection(userPageSection: userPageSection));
    context.pop(true);
  }
}
