import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:plant_market/src/core/data/defines/constants/image_constant.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/features/user/presentation/widgets/zoom_out_button.dart';
import 'package:plant_market/src/router/router_path.dart';

class AppBarHomePage extends StatelessWidget {
  final Widget? appBarTitle;

  const AppBarHomePage({
    super.key,
    this.appBarTitle,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      snap: true,
      forceElevated: false,
      floating: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      expandedHeight: context.sizeHeight(60),
      leadingWidth: context.sizeWidth(60),
      leading: ZoomOutButton(
        opacity: 1,
        borderRadius: context.sizeWidth(10),
        onPressed: () => context.go(RouterPath.searchPage),
        iconPath: imageConstant.searchSVG,
      ).animate().slide(
            duration: 300.ms,
            curve: Curves.easeInOut,
            end: Offset.zero,
            begin: const Offset(0, 1),
          ),
      flexibleSpace: _appBarTitle(context),
    );
  }

  Widget _appBarTitle(BuildContext context) {
    return FlexibleSpaceBar(
      expandedTitleScale: 1,
      titlePadding: context.padding(vertical: 5),
      centerTitle: true,
      title: appBarTitle,
    );
  }
}
