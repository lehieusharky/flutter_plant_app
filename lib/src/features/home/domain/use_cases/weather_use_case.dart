import 'package:injectable/injectable.dart';
import 'package:plant_market/src/core/di/di.dart';
import 'package:plant_market/src/core/use_cases/use_case.dart';
import 'package:plant_market/src/core/failure/failure.dart';
import 'package:plant_market/src/features/home/data/models/weather_model.dart';
import 'package:plant_market/src/features/home/domain/repositories/weather_repository.dart';

GetWeatherUseCase get getWeatherUseCase => injector.get<GetWeatherUseCase>();

abstract class GetWeatherUseCase {
  Future<WeatherModel> getWeatherInfo(GetWeatherParams params);
}

@Singleton(as: GetWeatherUseCase)
class GetWeatherUseCaseImpl extends UseCase<void, GetWeatherParams>
    implements GetWeatherUseCase {
  final WeatherRepository _getWeatherRepository;

  GetWeatherUseCaseImpl(this._getWeatherRepository);

  @override
  Future<WeatherModel> getWeatherInfo(GetWeatherParams params) async {
    try {
      final result = await _getWeatherRepository.getWeatherInfo(
        lat: params.lat,
        lon: params.lon,
      );
      return result.fold(
        (failure) {
          return WeatherModel();
        },
        (weatherModel) {
          return weatherModel;
        },
      );
    } catch (e) {
      throw ServerFailure(message: e.toString());
    }
  }

  @override
  Future<void> call(GetWeatherParams params) {
    throw UnimplementedError();
  }
}
