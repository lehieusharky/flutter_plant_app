import 'package:plant_market/src/features/popular_topic/data/models/plant_disease_model.dart';
import 'package:plant_market/src/features/popular_topic/data/models/plant_special_model.dart';

abstract class PlantDataSource {
  Future<PlantSpecialModel> getListPlantSpecial({
    required String q,
    int? page,
  });

  Future<PlantDiseaseModel> getListPlantDisease({
    required String q,
    int? page,
    int? id,
  });
}
