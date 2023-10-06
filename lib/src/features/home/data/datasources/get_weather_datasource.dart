import 'package:plant_market/src/core/di/di.dart';
import 'package:plant_market/src/features/home/data/models/weather_model.dart';

GetWeatherDataSource get getWeatherDataSource =>
    injector.get<GetWeatherDataSource>();

abstract class GetWeatherDataSource {
  Future<WeatherModel> getWeatherInfo({
    required String lat,
    required String lon,
  });
}
