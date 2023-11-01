import 'package:flutter/material.dart';
import 'package:plant_market/src/core/di/part_di.dart';
import 'package:plant_market/src/core/extension/responsive.dart';

class BodyCommunityPostDetail extends StatefulWidget {
  final String description;
  final List<String> tags;
  const BodyCommunityPostDetail(
      {super.key, required this.description, required this.tags});

  @override
  State<BodyCommunityPostDetail> createState() =>
      _BodyCommunityPostDetailState();
}

class _BodyCommunityPostDetailState extends State<BodyCommunityPostDetail> {
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          context.sizedBox(height: 5),
          Padding(
            padding: context.padding(horizontal: 12),
            child: _buildTags(context),
          ),
          context.sizedBox(height: 5),
          Padding(
            padding: context.padding(horizontal: 12),
            child: Text(
              widget.description,
              style:
                  theme(context).textTheme.titleLarge!.copyWith(fontSize: 18),
            ),
          ),
          context.sizedBox(height: 250),
          // ListTiles++
        ],
      ),
    );
  }

  Widget _buildTags(BuildContext context) {
    return SizedBox(
      height: context.sizeHeight(20),
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: widget.tags.length,
          separatorBuilder: (context, index) => context.sizedBox(width: 5),
          itemBuilder: (context, index) {
            return Text(
              widget.tags[index],
              style: theme(context).textTheme.titleSmall!.copyWith(
                    fontSize: 16,
                  ),
            );
          }),
    );
  }
}
