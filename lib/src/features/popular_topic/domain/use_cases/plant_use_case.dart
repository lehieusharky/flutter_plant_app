import 'package:injectable/injectable.dart';
import 'package:plant_market/src/core/di/di.dart';
import 'package:plant_market/src/core/failure/failure.dart';
import 'package:plant_market/src/core/use_cases/use_case.dart';
import 'package:plant_market/src/features/popular_topic/data/models/plant_disease_model.dart';
import 'package:plant_market/src/features/popular_topic/data/models/plant_special_model.dart';
import 'package:plant_market/src/features/popular_topic/domain/repositories/plant_repository.dart';

PlantUseCase get plantUseCase => injector.get<PlantUseCase>();

abstract class PlantUseCase {
  Future<PlantSpecialModel> getListPlantSpecial({
    required PlantSpecialListParams plantSpecialListParams,
  });

  Future<PlantDiseaseModel> getListPlantDisease({
    required PlantDiseaseListParams plantDiseaseListParams,
  });
}

@Injectable(as: PlantUseCase)
class PlantUseCaseImpl extends UseCase<void, NoParams> implements PlantUseCase {
  final PlantRepository _plantRepository;

  PlantUseCaseImpl(this._plantRepository);

  @override
  Future<void> call(NoParams params) {
    throw UnimplementedError();
  }

  @override
  Future<PlantSpecialModel> getListPlantSpecial(
      {required PlantSpecialListParams plantSpecialListParams}) async {
    try {
      final result = await _plantRepository.getListPlantSpecial(
        q: plantSpecialListParams.q,
        page: plantSpecialListParams.page,
      );
      return result.fold(
        (failure) {
        
          return const PlantSpecialModel();
        },
        (plantSpecialModel) => plantSpecialModel,
      );
    } catch (e) {
      throw PlantFailure(message: e.toString());
    }
  }

  @override
  Future<PlantDiseaseModel> getListPlantDisease(
      {required PlantDiseaseListParams plantDiseaseListParams}) async {
    try {
      final result = await _plantRepository.getListPlantDisease(
        q: plantDiseaseListParams.q,
        page: plantDiseaseListParams.page,
      );
      return result.fold(
        (failure) {
       
          return const PlantDiseaseModel();
        },
        (plantDiseaseModel) => plantDiseaseModel,
      );
    } catch (e) {
      throw PlantFailure(message: e.toString());
    }
  }
}
