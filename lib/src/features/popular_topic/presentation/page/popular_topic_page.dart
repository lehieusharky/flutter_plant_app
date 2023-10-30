import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:plant_market/src/core/data/defines/enum/plant_topic.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/core/presentation/page/base_page.dart';
import 'package:plant_market/src/core/use_cases/use_case.dart';
import 'package:plant_market/src/features/popular_topic/presentation/bloc/popular_topic_bloc.dart';
import 'package:plant_market/src/features/popular_topic/presentation/widgets/plant_special_list.dart';

class PopularTopicPage extends BaseWidget {
  final PlantTopic plantTopic;
  const PopularTopicPage({super.key, required this.plantTopic});

  @override
  BaseWidgetState createState() => _PopularTopicPageState();
}

class _PopularTopicPageState extends BaseWidgetState {
  late PlantTopic _plantTopic;

  @override
  void initState() {
    super.initState();
    _plantTopic = (widget as PopularTopicPage).plantTopic;
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      child: BlocProvider(
        create: (context) => PopularTopicBloc()
          ..add(
            PopularTopicChooseTopic(
                plantSpecialListParams:
                    PlantSpecialListParams(q: _plantTopic.getTopic, page: 1),
                plantDiseaseListParams:
                    PlantDiseaseListParams(q: _plantTopic.getTopic),
                plantTopic: _plantTopic),
          ),
        child: BlocConsumer<PopularTopicBloc, PopularTopicState>(
          listener: (context, state) {
            if (state is PopularTopicGetPlantDiseaseListSuccess) {
              Logger().d('success disease');
            }
          },
          builder: (context, state) {
            return const Column(
              children: [
                Text('abc'),
                Expanded(
                  child: PlantSpecialList(),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
