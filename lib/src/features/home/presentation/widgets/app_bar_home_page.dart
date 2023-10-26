import 'package:flutter/material.dart';
import 'package:plant_market/src/core/data/defines/constants/image_constant.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/features/user/presentation/widgets/zoom_out_button.dart';

class AppBarHomePage extends StatelessWidget {
  final Widget? appBarTitle;
  final double appBarBackGroundOpacity;
  final double actionWidgetOpacity;

  const AppBarHomePage({
    super.key,
    this.appBarTitle,
    required this.appBarBackGroundOpacity,
    required this.actionWidgetOpacity,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      snap: true,
      leadingWidth: context.sizeWidth(80),
      floating: true,
      backgroundColor: Theme.of(context)
          .scaffoldBackgroundColor
          .withOpacity(appBarBackGroundOpacity),
      expandedHeight: context.sizeHeight(60),
      leading: const SizedBox(),
      flexibleSpace: FlexibleSpaceBar(
        expandedTitleScale: 1,
        titlePadding: context.padding(vertical: 5),
        centerTitle: true,
        title: appBarTitle,
      ),
      actions: [
        ZoomOutButton(
          opacity: actionWidgetOpacity,
          onPressed: () {},
          iconPath: imageConstant.searchSVG,
        ),
      ],
    );
  }
}
