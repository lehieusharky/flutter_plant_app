import 'package:plant_market/src/features/home/data/models/weather_model.dart';

abstract class GetWeatherDataSource {
  Future<WeatherModel> getWeatherInfo({
    required String lat,
    required String lon,
  });
}
