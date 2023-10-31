import 'package:flutter/material.dart';
import 'package:plant_market/src/core/di/part_di.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/theme/theme_manager.dart';

class CustomSearchbar extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final void Function() onSubmit;
  const CustomSearchbar({
    super.key,
    required this.controller,
    required this.hintText,
    required this.onSubmit,
  });

  @override
  State<CustomSearchbar> createState() => _CustomSearchbarState();
}

class _CustomSearchbarState extends State<CustomSearchbar> {
  @override
  Widget build(BuildContext context) {
    return SearchBar(
      leading: Icon(
        Icons.search,
        size: context.sizeWidth(25),
        color: theme(context).textTheme.titleMedium!.color,
      ),
      hintText: widget.hintText,
      trailing: [
        IconButton(
          onPressed: widget.onSubmit,
          icon: Icon(
            Icons.send,
            size: context.sizeWidth(25),
            color: theme(context).textTheme.titleMedium!.color,
          ),
        )
      ],
      hintStyle: MaterialStateProperty.all(theme(context)
          .textTheme
          .titleMedium!
          .copyWith(
              color: theme(context)
                  .textTheme
                  .titleMedium!
                  .color!
                  .withOpacity(0.7))),
      shadowColor: MaterialStateProperty.all(ThemeManager.shadowButton()),
      shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
      controller: widget.controller,
      backgroundColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.pressed)) {
          return ThemeManager.backgroundButton().withOpacity(0.9);
        }
        return ThemeManager.backgroundButton();
      }),
      textStyle: MaterialStateProperty.all(theme(context).textTheme.titleLarge),
    );
  }
}
