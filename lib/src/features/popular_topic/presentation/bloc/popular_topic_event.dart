part of 'popular_topic_bloc.dart';

sealed class PopularTopicEvent extends Equatable {
  const PopularTopicEvent();

  @override
  List<Object> get props => [];
}

final class PopularTopicGetPlantSpecialList extends PopularTopicEvent {
  final PlantSpecialListParams plantSpecialListParams;

  const PopularTopicGetPlantSpecialList({required this.plantSpecialListParams});

  @override
  List<Object> get props => [plantSpecialListParams];
}

final class PopularTopicGetPlantDiseaseList extends PopularTopicEvent {
  final PlantDiseaseListParams plantDiseaseListParams;

  const PopularTopicGetPlantDiseaseList({required this.plantDiseaseListParams});

  @override
  List<Object> get props => [plantDiseaseListParams];
}

final class PopularTopicChooseTopic extends PopularTopicEvent {
  final PlantTopic plantTopic;
  final PlantSpecialListParams plantSpecialListParams;
  final PlantDiseaseListParams plantDiseaseListParams;

  const PopularTopicChooseTopic({
    required this.plantTopic,
    required this.plantSpecialListParams,
    required this.plantDiseaseListParams,
  });

  @override
  List<Object> get props =>
      [plantTopic, plantSpecialListParams, plantDiseaseListParams];
}
