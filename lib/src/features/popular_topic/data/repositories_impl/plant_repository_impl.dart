import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:plant_market/src/core/failure/failure.dart';
import 'package:plant_market/src/features/popular_topic/data/datasources/plant_datasource.dart';
import 'package:plant_market/src/features/popular_topic/data/models/plant_disease_model.dart';
import 'package:plant_market/src/features/popular_topic/data/models/plant_special_model.dart';
import 'package:plant_market/src/features/popular_topic/domain/repositories/plant_repository.dart';

@Injectable(as: PlantRepository)
class PlantRepositoryImpl implements PlantRepository {
  final PlantDataSource _plantDataSource;

  PlantRepositoryImpl(this._plantDataSource);

  @override
  Future<Either<PlantFailure, PlantSpecialModel>> getListPlantSpecial({
    required String q,
    int? page,
  }) async {
    try {
      final plantModel = await _plantDataSource.getListPlantSpecial(
        q: q,
        page: page,
      );
      return Right(plantModel);
    } catch (e) {
      return Left(PlantFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<PlantFailure, PlantDiseaseModel>> getListPlantDisease(
      {required String q, int? page, int? id}) async {
    try {
      final plantDiseaseModel =
          await _plantDataSource.getListPlantDisease(q: q, page: page, id: id);
      return Right(plantDiseaseModel);
    } catch (e) {
      return Left(PlantFailure(message: e.toString()));
    }
  }
}
