import 'package:flutter/material.dart';
import 'package:plant_market/src/core/constants.dart';
import 'package:plant_market/src/theme/font_theme.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final List<Widget>? action;
  final Widget? leading;
  final String title;
  final PreferredSizeWidget? bottom;
  final Color backgroundColor;

  const CustomAppBar({
    super.key,
    this.leading,
    this.action,
    this.title = AppConstant.nameApp,
    this.bottom,
    this.backgroundColor = Colors.transparent,
  });

  @override
  State<StatefulWidget> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(80);
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      bottom: widget.bottom,
      elevation: 0,
      toolbarHeight: 70,
      centerTitle: true,
      backgroundColor: widget.backgroundColor,
      leading: widget.leading,
      actions: widget.action,
      title: Text(
        widget.title,
        style: AppTextTheme.getDefaultTextTheme(context).bodyLarge,
      ),
    );
  }
}
