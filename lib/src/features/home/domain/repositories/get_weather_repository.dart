import 'package:dartz/dartz.dart';
import 'package:plant_market/src/core/di/di.dart';
import 'package:plant_market/src/features/auth/login/domain/use_cases/failure.dart';
import 'package:plant_market/src/features/home/data/models/weather_model.dart';

// GetWeatherRepository get getWeatherRepository =>
//     injector.get<GetWeatherRepository>();

abstract class GetWeatherRepository {
  Future<Either<ServerFailure, WeatherModel>> getWeatherInfo({
    required String lat,
    required String lon,
  });
}
