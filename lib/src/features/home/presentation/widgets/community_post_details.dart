import 'package:flutter/material.dart';
import 'package:plant_market/src/core/di/part_di.dart';
import 'package:plant_market/src/core/extension/localization.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_button.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_catched_network_image.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_divider.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_heart_button.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_seperator.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_text_button.dart';
import 'package:plant_market/src/features/home/data/models/community_post_model.dart';
import 'package:plant_market/src/theme/color_theme.dart';

class CommunityPostDetails extends StatelessWidget {
  final CommunityPostModel communityPostModel;
  const CommunityPostDetails({super.key, required this.communityPostModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: context.padding(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomTextButton.cancel(context),
                const CustomSeperator(),
                CustomTextButton.save(
                    saveText: translate(context).save,
                    context: context,
                    onPressed: () {})
              ],
            ),
            const CustomDivider(),
            context.sizedBox(height: 5),
            Stack(
              children: [
                CustomCatchedNetWorkImage(
                  imageUrl: communityPostModel.image,
                  width: context.width,
                  height: context.sizeHeight(400),
                  borderRadius: context.sizeWidth(10),
                ),
                const CustomHeartButton(),
              ],
            ),
            context.sizedBox(height: 5),
            SizedBox(
              height: context.sizeHeight(30),
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: communityPostModel.tags.length,
                  separatorBuilder: (context, index) =>
                      context.sizedBox(width: 5),
                  itemBuilder: (context, index) {
                    return Text(
                      communityPostModel.tags[index],
                      style: theme(context).textTheme.titleSmall,
                    );
                  }),
            ),
            Text(
              communityPostModel.title,
              style: theme(context).textTheme.titleLarge!.copyWith(
                    fontSize: context.sizeWidth(30),
                  ),
            ),
            context.sizedBox(height: 5),
            Text(
              communityPostModel.description,
              style: theme(context).textTheme.titleMedium,
            ),
            context.sizedBox(height: 10),
            CustomButton.send(
              context: context,
              onPressed: () {},
              title: 'Luu bai viet',
              backgroundColor: colorTheme.get2DDA93,
            ),
            context.sizedBox(height: 10),
          ],
        ),
      ),
    ));
  }
}
