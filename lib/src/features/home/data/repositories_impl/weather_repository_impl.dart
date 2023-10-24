import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:plant_market/src/core/failure/failure.dart';
import 'package:plant_market/src/features/home/data/datasources/weather_datasource.dart';
import 'package:plant_market/src/features/home/data/models/weather_model.dart';
import 'package:plant_market/src/features/home/domain/repositories/weather_repository.dart';

@Injectable(as: WeatherRepository)
class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherDataSource _dataSource;

  WeatherRepositoryImpl(this._dataSource);

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
