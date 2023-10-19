import 'package:flutter/material.dart';
import 'package:plant_market/src/core/di/part_di.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_catched_network_image.dart';

class SearchItem extends StatelessWidget {
  const SearchItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding(vertical: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomCatchedNetWorkImage(
            width: context.sizeWidth(80),
            height: context.sizeWidth(80),
            borderRadius: 10,
            imageUrl:
                'https://scontent-hkg4-1.xx.fbcdn.net/v/t39.30808-6/387120876_122128939034025791_3285515382313764214_n.jpg?_nc_cat=1&ccb=1-7&_nc_sid=5f2048&_nc_ohc=kSPBpghYo9kAX8akm3q&_nc_ht=scontent-hkg4-1.xx&oh=00_AfDC80T-8pJXJpKY98oOoexPVF5B2VHnQLl37CfTPO92mw&oe=652D688C',
          ),
          context.sizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Trong cay xuong rong',
                  overflow: TextOverflow.ellipsis,
                  style: theme(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontWeight: FontWeight.w600),
                ),
                context.sizedBox(height: 5),
                Text(
                  'Scientific name',
                  style: theme(context).textTheme.titleSmall!.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
