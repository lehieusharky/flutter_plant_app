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
                'https://scontent-hkg4-1.xx.fbcdn.net/v/t39.30808-6/379603375_122133954656002310_7008112289286133793_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeG7tg8JUz89gLcOohRPTCcsB0DVtcbxoPcHQNW1xvGg95XJjWwuxjGtoGYh1EeWBlI3h1FY8zBI3QB64PUnifzT&_nc_ohc=8UI71TbbBzEAX-KkOe_&_nc_ht=scontent-hkg4-1.xx&oh=00_AfDx6WbpmLVou_jFfsnxHU3Ima5xYXMJCxCAE5jagZn6Tg&oe=654438EE',
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
