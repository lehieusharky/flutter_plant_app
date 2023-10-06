import 'package:flutter/material.dart';
import 'package:plant_market/src/core/extension/localization.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_text_form_field.dart';
import 'package:plant_market/src/features/home/presentation/widgets/weather_home_page.dart';
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
  final _heightOfSearchBar = 80;
  final _heightOfBackgroundContainer = 175;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        const WeatherHomeage(),
        Padding(
          padding: context.padding(
              top: _heightOfBackgroundContainer - _heightOfSearchBar / 2 + 5),
          child: Padding(
            padding: context.padding(horizontal: 24),
            child: CustomTextFormField(
              height: context.sizeHeight(80),
              borderRadius: 100,
              prefixIcon: Icon(
                Icons.search,
                size: context.sizeWidth(25),
                color: colorTheme.getD2D2D2,
              ),
              boxShadowColor: colorTheme.get6A6F7D.withOpacity(0.2),
              controller: widget.searchController,
              keyboardType: TextInputType.text,
              hintText: translate(context).search,
              backgroundColor: colorTheme.getFFFFFF,
            ),
          ),
        )
      ],
    );
  }
}
