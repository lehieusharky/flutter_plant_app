import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_loading.dart';
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
          return const Center(child: CustomLoading());
        } else {
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: state.data!.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return PlantSpecialItem(
                title: state.data![index].commonName.toString(),
                image: state.data![index].defaultImage == null
                    ? 'https://scontent-hkg4-1.xx.fbcdn.net/v/t39.30808-6/379603375_122133954656002310_7008112289286133793_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeG7tg8JUz89gLcOohRPTCcsB0DVtcbxoPcHQNW1xvGg95XJjWwuxjGtoGYh1EeWBlI3h1FY8zBI3QB64PUnifzT&_nc_ohc=8UI71TbbBzEAX-KkOe_&_nc_ht=scontent-hkg4-1.xx&oh=00_AfDx6WbpmLVou_jFfsnxHU3Ima5xYXMJCxCAE5jagZn6Tg&oe=654438EE'
                    : state.data![index].defaultImage!.originalUrl,
                spectificName: state.data![index].scientificName![0],
                subDescription: state.data![index].cycle,
              );
            },
          );
        }
      },
    );
  }
}
