import 'package:injectable/injectable.dart';
import 'package:plant_market/src/core/utils/end_points.dart';
import 'package:plant_market/src/core/utils/http_util.dart';
import 'package:plant_market/src/features/home/data/datasources/weather_datasource.dart';
import 'package:plant_market/src/features/home/data/models/weather_model.dart';

@Injectable(as: WeatherDataSource)
class WeatherDataSourceImpl implements WeatherDataSource {
  @override
  Future<WeatherModel> getWeatherInfo({
    required String lat,
    required String lon,
  }) async {
    try {
      final String weatherUrl = EndPoints.weather(lat: lat, lon: lon);
      final response = await HttpUtil.get(weatherUrl);

      if (HttpUtil.checkResponseStatusCode(response: response)) {
        return WeatherModel.fromJson(response.body);
      }
      return WeatherModel();
    } catch (e) {
      throw Exception(e);
    }
  }
}