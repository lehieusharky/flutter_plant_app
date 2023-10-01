import 'package:flutter/material.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/core/extensions.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_text_form_field.dart';
import 'package:plant_market/src/features/home_page/widgets/background_container.dart';
import 'package:plant_market/src/theme/color_theme.dart';

class HeaderHomePage extends StatefulWidget {
  final TextEditingController searchController;
  const HeaderHomePage({
    super.key,
    required this.searchController,
  });

  @override
  State<HeaderHomePage> createState() => _HeaderHomePageState();
}

class _HeaderHomePageState extends State<HeaderHomePage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        BackGroundContainer(
          color: colorTheme.get2DDA93,
        ),
        Padding(
          padding: context.padding(top: 150),
          child: Padding(
            padding: context.padding(horizontal: 24),
            child: CustomTextFormField(
              borderRadius: 3100,
              controller: widget.searchController,
              keyboardType: TextInputType.text,
              hintText: translate(context).search,
            ),
          ),
        )
      ],
    );
  }
}
