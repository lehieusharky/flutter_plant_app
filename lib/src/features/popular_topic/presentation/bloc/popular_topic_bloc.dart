import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_market/src/core/data/defines/enum/plant_topic.dart';
import 'package:plant_market/src/core/use_cases/use_case.dart';
import 'package:plant_market/src/features/popular_topic/data/models/plant_disease_model.dart';
import 'package:plant_market/src/features/popular_topic/data/models/plant_special_model.dart';
import 'package:plant_market/src/features/popular_topic/domain/use_cases/plant_use_case.dart';

part 'popular_topic_event.dart';
part 'popular_topic_state.dart';

class PopularTopicBloc extends Bloc<PopularTopicEvent, PopularTopicState> {
  PopularTopicBloc() : super(PopularTopicInitial()) {
    on<PopularTopicGetPlantSpecialList>(_getPlantSpecialList);
    on<PopularTopicGetPlantDiseaseList>(_getPlantDiseaseList);
    on<PopularTopicChooseTopic>(_chooseTopic);
  }

  Future<void> _getPlantSpecialList(
    PopularTopicGetPlantSpecialList event,
    Emitter<PopularTopicState> emit,
  ) async {
    try {
      final plantSpecialModel = await plantUseCase.getListPlantSpecial(
          plantSpecialListParams: event.plantSpecialListParams);
      emit(PopularTopicGetPlantSpecialListSuccess(
          plantSpecialModel: plantSpecialModel));
    } catch (e) {
      emit(PopularTopicFailure(message: e.toString()));
    }
  }

  Future<void> _getPlantDiseaseList(
    PopularTopicGetPlantDiseaseList event,
    Emitter<PopularTopicState> emit,
  ) async {
    try {
      final plantdiseaseModel = await plantUseCase.getListPlantDisease(
          plantDiseaseListParams: event.plantDiseaseListParams);
      emit(PopularTopicGetPlantDiseaseListSuccess(
          plantDiseaseModel: plantdiseaseModel));
    } catch (e) {
      emit(PopularTopicFailure(message: e.toString()));
    }
  }

  Future<void> _chooseTopic(
    PopularTopicChooseTopic event,
    Emitter<PopularTopicState> emit,
  ) async {
    try {
      if (event.plantTopic == PlantTopic.disease) {
        add(PopularTopicGetPlantDiseaseList(
            plantDiseaseListParams: event.plantDiseaseListParams));
      } else {
        add(PopularTopicGetPlantSpecialList(
            plantSpecialListParams: event.plantSpecialListParams));
      }
    } catch (e) {
      emit(PopularTopicFailure(message: e.toString()));
    }
  }
}
