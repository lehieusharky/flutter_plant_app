import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';
import 'package:plant_market/src/core/utils/end_points.dart';
import 'package:plant_market/src/core/utils/http_util.dart';
import 'package:plant_market/src/features/popular_topic/data/datasources/plant_datasource.dart';
import 'package:plant_market/src/features/popular_topic/data/models/plant_disease_model.dart';
import 'package:plant_market/src/features/popular_topic/data/models/plant_special_model.dart';

@Injectable(as: PlantDataSource)
class PlantDataSourceImpl implements PlantDataSource {
  final plantApiKey = dotenv.get(
    "PLANT_API_KEY",
    fallback: "PLANT_API_KEY_NOT_FOUND",
  );

  @override
  Future<PlantSpecialModel> getListPlantSpecial({
    required String q,
    int? page,
  }) async {
    try {
      final plantSpecialListParams = {
        "key": plantApiKey,
        "q": q,
        "page": page,
      };

      final response = await HttpUtil.get(
        EndPoints.plantSpecialUrl,
        queryParameters: plantSpecialListParams,
      );

      if (response.statusCode == 200) {
        final result = PlantSpecialModel.fromJson(response.body);
        return result;
      }
      return const PlantSpecialModel();
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<PlantDiseaseModel> getListPlantDisease({
    required String q,
    int? page,
    int? id,
  }) async {
    try {
      final plantDiseaseListParams = {
        "key": plantApiKey,
        "q": q,
        "page": 1,
        "id": id,
      };

      final response = await HttpUtil.get(
        EndPoints.plantDiseaseUrl,
        queryParameters: plantDiseaseListParams,
      );

      if (response.statusCode == 200) {
        final result = PlantDiseaseModel.fromJson(response.body);
        return result;
      }
      return const PlantDiseaseModel();
    } catch (e) {
      throw Exception(e);
    }
  }
}
