import 'package:flutter/material.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/core/presentation/page/base_page.dart';
import 'package:plant_market/src/features/user/data/mock/mock_user.dart';
import 'package:plant_market/src/features/user/presentation/widgets/separator.dart';
import 'package:plant_market/src/features/user/presentation/widgets/time_line_item.dart';

class UserPage extends BaseWidget {
  const UserPage({super.key});

  @override
  BaseWidgetState createState() => _UserPageState();
}

class _UserPageState extends BaseWidgetState
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BaseWidget(
      child: Column(
        children: [
          const Text('user'),
          Expanded(
            child: ListView.separated(
              itemCount: MockUser.timeLineArray.length,
              itemBuilder: (context, index) {
                return TimeLineItem(
                  image: MockUser.timeLineArray[index].image,
                  title: MockUser.timeLineArray[index].title,
                  description: MockUser.timeLineArray[index].description,
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: context.padding(horizontal: 40, vertical: 8),
                  child: const MySeparator(),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
