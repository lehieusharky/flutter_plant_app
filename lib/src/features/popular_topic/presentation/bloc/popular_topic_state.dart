part of 'popular_topic_bloc.dart';

sealed class PopularTopicState extends Equatable {
  const PopularTopicState();

  @override
  List<Object> get props => [];
}

final class PopularTopicInitial extends PopularTopicState {}

final class PopularTopicGetPlantSpecialListSuccess extends PopularTopicState {
  final PlantSpecialModel plantSpecialModel;

  const PopularTopicGetPlantSpecialListSuccess(
      {required this.plantSpecialModel});

  @override
  List<Object> get props => [plantSpecialModel];
}

final class PopularTopicGetPlantDiseaseListSuccess extends PopularTopicState {
  final PlantDiseaseModel plantDiseaseModel;

  const PopularTopicGetPlantDiseaseListSuccess(
      {required this.plantDiseaseModel});

  @override
  List<Object> get props => [plantDiseaseModel];
}

final class PopularTopicFailure extends PopularTopicState {
  final String message;

  const PopularTopicFailure({required this.message});

  @override
  List<Object> get props => [message];
}

final class PopularTopicChooseTopicSuccess extends PopularTopicState {
  final PlantTopic plantTopic;

  const PopularTopicChooseTopicSuccess({required this.plantTopic});

  @override
  List<Object> get props => [plantTopic];
}
