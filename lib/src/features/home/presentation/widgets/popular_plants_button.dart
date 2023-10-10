import 'package:flutter/material.dart';
import 'package:plant_market/src/core/data/defines/constants/image_constant.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/theme/color_theme.dart';

class PolularPlantsButton extends StatelessWidget {
  const PolularPlantsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.sizeHeight(580),
      child: GridView.count(
        primary: false,
        padding: context.padding(horizontal: 12),
        crossAxisSpacing: context.sizeWidth(10),
        mainAxisSpacing: context.sizeWidth(10),
        crossAxisCount: 2,
        children: <Widget>[
          _buildPopularPlantsItem(colors: [
            colorTheme.get2DDA93.withOpacity(0.8),
            colorTheme.get2DDA93.withOpacity(0.7),
            colorTheme.get2DDA93.withOpacity(0.6),
            colorTheme.get2DDA93.withOpacity(0.5),
            colorTheme.get2DDA93.withOpacity(0.4),
            colorTheme.get2DDA93.withOpacity(0.2),
          ], image: imageConstant.nightImage, title: 'Vegetables'),
          _buildPopularPlantsItem(colors: [
            colorTheme.get2DDA93.withOpacity(0.7),
            colorTheme.get2DDA93.withOpacity(0.4),
            colorTheme.get2DDA93,
          ], image: imageConstant.nightImage, title: 'Flowers'),
          _buildPopularPlantsItem(colors: [
            colorTheme.get2DDA93.withOpacity(0.7),
            colorTheme.get2DDA93.withOpacity(0.4),
            colorTheme.get2DDA93,
          ], image: imageConstant.nightImage, title: 'Fruits'),
          _buildPopularPlantsItem(colors: [
            colorTheme.get2DDA93.withOpacity(0.7),
            colorTheme.get2DDA93.withOpacity(0.4),
            colorTheme.get2DDA93,
          ], image: imageConstant.nightImage, title: 'Weeds'),
          _buildPopularPlantsItem(colors: [
            colorTheme.get2DDA93.withOpacity(0.7),
            colorTheme.get2DDA93.withOpacity(0.4),
            colorTheme.get2DDA93,
          ], image: imageConstant.nightImage, title: 'Trees'),
          _buildPopularPlantsItem(colors: [
            colorTheme.get2DDA93.withOpacity(0.7),
            colorTheme.get2DDA93.withOpacity(0.4),
            colorTheme.get2DDA93,
          ], image: imageConstant.nightImage, title: 'Toxic Plants'),
        ],
      ),
    );
  }

  Widget _buildPopularPlantsItem({
    required String image,
    required String title,
    required List<Color> colors,
  }) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: colors),
        borderRadius: BorderRadius.circular(3),
      ),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Image.asset(
            image,
          ),
          Text(title),
        ],
      ),
    );
  }
}
