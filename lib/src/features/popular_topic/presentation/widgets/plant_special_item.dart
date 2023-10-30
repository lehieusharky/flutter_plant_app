import 'package:flutter/material.dart';
import 'package:plant_market/src/core/data/defines/constants/image_constant.dart';
import 'package:plant_market/src/core/di/part_di.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_catched_network_image.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_svg.dart';
import 'package:plant_market/src/theme/theme_manager.dart';

class PlantSpecialItem extends StatelessWidget {
  final String title;
  final String? spectificName;
  final String? image;
  final String? subDescription;
  const PlantSpecialItem(
      {super.key,
      required this.title,
      this.image,
      this.spectificName,
      this.subDescription});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: context.padding(vertical: 12, horizontal: 6),
        child: Container(
          width: context.width,
          height: context.sizeHeight(110),
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                color: ThemeManager.shadowButton(),
                spreadRadius: 2,
                blurRadius: 10,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomCatchedNetWorkImage(
                  imageUrl: image ??
                      'https://scontent-hkg4-1.xx.fbcdn.net/v/t39.30808-6/379603375_122133954656002310_7008112289286133793_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeG7tg8JUz89gLcOohRPTCcsB0DVtcbxoPcHQNW1xvGg95XJjWwuxjGtoGYh1EeWBlI3h1FY8zBI3QB64PUnifzT&_nc_ohc=8UI71TbbBzEAX-KkOe_&_nc_ht=scontent-hkg4-1.xx&oh=00_AfDx6WbpmLVou_jFfsnxHU3Ima5xYXMJCxCAE5jagZn6Tg&oe=654438EE',
                  width: context.sizeWidth(95),
                  height: context.sizeHeight(95),
                ),
                context.sizedBox(width: 14),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildTitle(context),
                      context.sizedBox(height: 5),
                      _buildSpectificName(context),
                      context.sizedBox(height: 5),
                      _buildLifeCycle(context),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Text(
      title,
      maxLines: 2,
      style: theme(context)
          .textTheme
          .titleMedium!
          .copyWith(fontWeight: FontWeight.w600, fontSize: 18),
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildSpectificName(BuildContext context) {
    return Text(
      spectificName ?? '',
      style: theme(context).textTheme.titleSmall!.copyWith(),
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildLifeCycle(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomSvg(
          path: imageConstant.cycleSVG,
          width: context.sizeWidth(18),
          height: context.sizeHeight(18),
        ),
        context.sizedBox(width: 5),
        Text(
          subDescription ?? '',
          style: theme(context).textTheme.titleSmall!.copyWith(),
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
