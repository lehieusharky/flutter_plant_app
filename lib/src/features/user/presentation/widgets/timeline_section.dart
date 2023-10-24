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
      body: BlocSelector<UserBloc, UserState, List<TimeLineModel>>(
        selector: (state) {
          if (state is UserGetListTimeLineSuccess) {
            return state.listTimeLine;
          }
          return [];
        },
        builder: (context, state) {
          if (state == []) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: state.length,
                    itemBuilder: (context, index) {
                      return TimeLineItem(
                        image: state[index].image,
                        title: state[index].description,
                        description: state[index].createAt,
                      );
                    },
                  ),
                ),
                context.sizedBox(height: 60),
              ],
            );
          }
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
