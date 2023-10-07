import 'package:injectable/injectable.dart';
import 'package:plant_market/src/core/di/di.dart';
import 'package:plant_market/src/core/use_cases/use_case.dart';
import 'package:plant_market/src/features/auth/login/domain/use_cases/failure.dart';
import 'package:plant_market/src/features/home/data/models/weather_model.dart';
import 'package:plant_market/src/features/home/domain/repositories/get_weather_repository.dart';

GetWeatherUseCase get getWeatherUseCase => injector.get<GetWeatherUseCase>();

abstract class GetWeatherUseCase {
  Future<WeatherModel> call(GetWeatherParams params);
}

@Singleton(as: GetWeatherUseCase)
class GetWeatherUseCaseImpl extends UseCase<WeatherModel, GetWeatherParams>
    implements GetWeatherUseCase {
  final GetWeatherRepository _getWeatherRepository;

  GetWeatherUseCaseImpl(this._getWeatherRepository);

  @override
  Future<WeatherModel> call(GetWeatherParams params) async {
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
}
