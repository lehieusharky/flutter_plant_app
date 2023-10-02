import 'package:flutter/material.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_catched_network_image.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_heart_button.dart';
import 'package:plant_market/src/features/home_page/mock/list_post_mock.dart';
import 'package:plant_market/src/theme/font_theme.dart';

class ItemPost extends StatelessWidget {
  final int index;
  const ItemPost({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding(right: 15),
      child: Column(
        children: [
          Container(
            width: context.sizeWidth(300),
            height: context.sizeHeight(250),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            child: Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Stack(
                  alignment: Alignment.topRight,
                  children: [
                    CustomCatchedNetWorkImage(
                      imageUrl: ListPostMock.posts[index].listImage[0],
                    ),
                    const CustomHeartButton()
                  ],
                ),
                Padding(
                  padding: context.padding(horizontal: 10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ListPostMock.posts[index].title,
                        style:
                            AppTextTheme.getDefaultTextTheme(context).bodyLarge,
                      ),
                      context.sizedBox(height: 5),
                      _buildAuthorAndTimeText(context),
                      context.sizedBox(height: 5)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAuthorAndTimeText(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '${ListPostMock.posts[index].author} - ',
          style: AppTextTheme.getDefaultTextTheme(context).labelMedium,
        ),
        Text(
          ListPostMock.posts[index].createAt,
          style: AppTextTheme.getDefaultTextTheme(context).labelMedium,
        ),
      ],
    );
  }
}
