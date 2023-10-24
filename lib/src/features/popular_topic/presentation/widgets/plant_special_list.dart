import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_market/src/features/popular_topic/data/models/plant_special_model.dart';
import 'package:plant_market/src/features/popular_topic/presentation/bloc/popular_topic_bloc.dart';
import 'package:plant_market/src/features/popular_topic/presentation/widgets/plant_special_item.dart';

class PlantSpecialList extends StatefulWidget {
  const PlantSpecialList({super.key});

  @override
  State<PlantSpecialList> createState() => _PlantSpecialListState();
}

class _PlantSpecialListState extends State<PlantSpecialList> {
  @override
  Widget build(BuildContext context) {
    return BlocSelector<PopularTopicBloc, PopularTopicState, PlantSpecialModel>(
      selector: (state) {
        if (state is PopularTopicGetPlantSpecialListSuccess) {
          return state.plantSpecialModel;
        }
        return const PlantSpecialModel();
      },
      builder: (context, state) {
        if (state.data == null) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView.builder(
            itemCount: state.data!.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return PlantSpecialItem(
                title: state.data![index].id.toString(),
              );
            },
          );
        }
      },
    );
  }
}
