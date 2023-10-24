import 'package:dartz/dartz.dart';
import 'package:plant_market/src/core/failure/failure.dart';
import 'package:plant_market/src/features/popular_topic/data/models/plant_disease_model.dart';
import 'package:plant_market/src/features/popular_topic/data/models/plant_special_model.dart';

abstract class PlantRepository {
  Future<Either<PlantFailure, PlantSpecialModel>> getListPlantSpecial({
    required String q,
    int? page,
  });

  Future<Either<PlantFailure, PlantDiseaseModel>> getListPlantDisease({
    required String q,
    int? page,
    int? id,
  });
}
