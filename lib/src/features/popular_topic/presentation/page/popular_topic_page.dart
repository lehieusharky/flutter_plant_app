import 'package:flutter/material.dart';
import 'package:plant_market/src/core/di/part_di.dart';
import 'package:plant_market/src/core/presentation/page/base_page.dart';

class PopularTopicPage extends StatefulWidget {
  const PopularTopicPage({super.key});

  @override
  State<PopularTopicPage> createState() => _PopularTopicPageState();
}

class _PopularTopicPageState extends State<PopularTopicPage> {
  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      child: Center(
        child: Text(
          'Popular Topic',
          style: theme(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}
