import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/features/user/data/models/time_line_model.dart';
import 'package:plant_market/src/features/user/presentation/bloc/user_bloc.dart';
import 'package:plant_market/src/features/user/presentation/widgets/time_line_item.dart';

class TimeLineSection extends StatefulWidget {
  const TimeLineSection({super.key});

  @override
  State<TimeLineSection> createState() => _TimeLineSectionState();
}

class _TimeLineSectionState extends State<TimeLineSection>
    with AutomaticKeepAliveClientMixin {
  List<TimeLineModel> _listTimeLineModel = [];

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: BlocConsumer<UserBloc, UserState>(
        listener: (context, state) {
          if (state is UserGetListTimeLineSuccess) {
            _listTimeLineModel = state.listTimeLine;
          }
        },
        builder: (context, state) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: _listTimeLineModel.length,
                  itemBuilder: (context, index) {
                    return TimeLineItem(
                      image: _listTimeLineModel[index].image,
                      title: _listTimeLineModel[index].description,
                      description: _listTimeLineModel[index].createAt,
                    );
                  },
                ),
              ),
              context.sizedBox(height: 80),
            ],
          );
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
