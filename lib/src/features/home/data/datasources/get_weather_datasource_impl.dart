import 'package:injectable/injectable.dart';
import 'package:plant_market/src/core/utils/end_points.dart';
import 'package:plant_market/src/core/utils/http_util.dart';
import 'package:plant_market/src/features/home/data/datasources/get_weather_datasource.dart';
import 'package:plant_market/src/features/home/data/models/weather_model.dart';

@Injectable(as: GetWeatherDataSource)
class GetWeatherDataSourceImpl implements GetWeatherDataSource {
  @override
  Future<WeatherModel> getWeatherInfo({
    required String lat,
    required String lon,
  }) async {
    try {
      final String weatherUrl = EndPoints.weather(lat: lat, lon: lon);
      final response = await HttpHelper.get(weatherUrl);

      if (response.statusCode == 200) {
        return WeatherModel.fromJson(response.body);
      }
      return WeatherModel();
    } catch (e) {
      throw Exception(e);
    }
  }
}