import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:plant_market/src/features/auth/login/domain/use_cases/failure.dart';
import 'package:plant_market/src/features/home/data/datasources/get_weather_datasource.dart';
import 'package:plant_market/src/features/home/data/models/weather_model.dart';
import 'package:plant_market/src/features/home/domain/repositories/get_weather_repository.dart';

@Injectable(as: GetWeatherRepository)
class GetWeatherRepositoryImpl implements GetWeatherRepository {
  // * lazy load datasource
  final GetWeatherDataSource _dataSource;

  GetWeatherRepositoryImpl(this._dataSource);

  @override
  Future<Either<ServerFailure, WeatherModel>> getWeatherInfo({
    required String lat,
    required String lon,
  }) async {
    try {
      final result = await _dataSource.getWeatherInfo(lat: lat, lon: lon);
      return Right(result);
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }
}
