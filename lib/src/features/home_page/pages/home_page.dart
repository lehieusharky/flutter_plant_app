import 'package:flutter/material.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/core/extensions.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_text_form_field.dart';
import 'package:plant_market/src/features/home_page/widgets/background_container.dart';
import 'package:plant_market/src/features/home_page/widgets/topic_button.dart';
import 'package:plant_market/src/theme/color_theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Stack(
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
                      controller: _searchController,
                      keyboardType: TextInputType.text,
                      hintText: translate(context).search,
                    ),
                  ),
                )
              ],
            ),
            context.sizedBox(height: 35),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TopicButton(
                  onPressed: () {},
                  shadowColor: colorTheme.get2DDA93.withOpacity(0.4),
                  backgroundColor: colorTheme.get2cd992,
                ),
                TopicButton(
                  onPressed: () {},
                  shadowColor: Colors.transparent,
                  backgroundColor: Colors.white,
                ),
                TopicButton(
                  onPressed: () {},
                  shadowColor: Colors.transparent,
                  backgroundColor: Colors.white,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
