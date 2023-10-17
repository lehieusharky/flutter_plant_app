import 'package:flutter/material.dart';
import 'package:plant_market/src/core/di/di_set_up.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_catched_network_image.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_heart_button.dart';

class ItemPost extends StatelessWidget {
  const ItemPost({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding(right: 15),
      child: SizedBox(
        width: context.sizeWidth(280),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                CustomCatchedNetWorkImage(
                  width: context.sizeWidth(280),
                  height: context.sizeHeight(150),
                  imageUrl:
                      'https://scontent.fsgn5-3.fna.fbcdn.net/v/t1.6435-9/90779147_110839670557168_3505635285763358720_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=300f58&_nc_ohc=7JExTQNyDpUAX-MNRJX&_nc_ht=scontent.fsgn5-3.fna&oh=00_AfBeEigWAPEtuuWjTsDXc8tgfs-LG_NAkKZ5Dl8kVL1F6Q&oe=6555A6E5',
                ),
                const CustomHeartButton(),
              ],
            ),
            context.sizedBox(height: 10),
            _buildTitle(context),
            context.sizedBox(height: 5),
            _buildAuthorAndDateTime(context),
            context.sizedBox(height: 5),
            _buildTag(),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Text(
      'Cach trong cay trong nha',
      style: theme(context)
          .textTheme
          .titleMedium!
          .copyWith(fontWeight: FontWeight.w600, fontSize: 15),
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildAuthorAndDateTime(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Le Nguyen Duc Hieu',
          style: theme(context).textTheme.titleSmall!.copyWith(),
          overflow: TextOverflow.ellipsis,
        ),
        const Text('__'),
        Text(
          '01/10/2023',
          style: theme(context).textTheme.titleSmall!.copyWith(),
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  Widget _buildTag() {
    return SizedBox(
      height: 20,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 2,
        itemBuilder: (context, index) {
          return Padding(
            padding: context.padding(horizontal: 3),
            child: Text(
              '#hoaHong',
              style: theme(context).textTheme.titleSmall!.copyWith(
                    decoration: TextDecoration.underline,
                  ),
            ),
          );
        },
      ),
    );
  }
}
