import 'package:flutter/material.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_text_form_field.dart';
import 'package:plant_market/src/theme/theme_manager.dart';

class SearchBar extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  const SearchBar({
    super.key,
    required this.controller,
    required this.hintText,
  });

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: widget.controller,
      keyboardType: TextInputType.text,
      hintText: widget.hintText,
      borderRadius: context.sizeWidth(10),
      backgroundColor: ThemeManager.backgroundButton(),
    );
  }
}
