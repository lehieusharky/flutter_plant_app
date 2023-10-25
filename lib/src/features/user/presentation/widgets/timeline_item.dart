import 'package:flutter/material.dart';
import 'package:plant_market/src/core/di/part_di.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_border.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_catched_network_image.dart';
import 'package:plant_market/src/theme/color_theme.dart';
import 'package:plant_market/src/theme/theme_manager.dart';

class TimeLineItem extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  const TimeLineItem({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding(vertical: 5),
      child: Stack(
        children: [
          _buildBackground(context),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: context.padding(horizontal: 8, top: 8, bottom: 5),
                child: Center(
                  child: CustomCatchedNetWorkImage(
                    width: context.width * 0.9,
                    height: context.sizeHeight(160),
                    imageUrl: image,
                  ),
                ),
              ),
              Padding(
                padding: context.padding(horizontal: 20),
                child: Text(
                  'Chúng tôi có đội ngũ nhân viên bao gồm các kỹ sư nông nghiệp và thợ làm vườn nhiều năm kinh nghiệm có khả năng xử lý các tình huống sự cố về cây xanh, đặc biệt là những dòng cây quý hiếm và trồng lâu năm',
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: theme(context).textTheme.titleLarge,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBackground(BuildContext context) {
    return CustomShadow.button(
      boxShadowColor: ThemeManager.shadowButton(),
      child: Container(
        width: context.width,
        height: context.sizeHeight(230),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(context.sizeWidth(5)),
          color: colorTheme.get252A3D,
        ),
      ),
    );
  }
}
