import 'package:flutter/material.dart';
import 'package:plant_market/src/core/di/part_di.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/theme/color_theme.dart';

class CustomTabBar extends StatefulWidget implements PreferredSizeWidget {
  final TabController tabController;
  final List<Widget> tabs;

  const CustomTabBar({
    super.key,
    required this.tabController,
    required this.tabs,
  });

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();

  @override
  Size get preferredSize => const Size.fromHeight(10);
}

class _CustomTabBarState extends State<CustomTabBar> {
  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: widget.tabController,
      labelColor: theme(context).textTheme.titleMedium!.color,
      unselectedLabelColor: colorTheme.get6A6F7D,
      indicatorPadding: context.padding(horizontal: 20),
      indicatorWeight: context.sizeWidth(2),
      indicatorSize: TabBarIndicatorSize.tab,
      indicatorColor: colorTheme.get2DDA93,
      tabs: widget.tabs,
      labelStyle: theme(context).textTheme.titleLarge,
      unselectedLabelStyle: theme(context).textTheme.titleLarge,
    );
  }
}
