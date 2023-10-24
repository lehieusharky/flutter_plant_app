import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hive/hive.dart';
import 'package:plant_market/src/core/data/defines/constants/app_constant.dart';
import 'package:plant_market/src/core/services/date_time_service.dart';
import 'package:plant_market/src/core/use_cases/use_case.dart';
import 'package:plant_market/src/features/home/data/enum/topic_symbol.dart';
import 'package:plant_market/src/features/home/data/models/weather_model.dart';
import 'package:plant_market/src/features/home/domain/use_cases/location_use_case.dart';
import 'package:plant_market/src/features/home/domain/use_cases/weather_use_case.dart';
part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc() : super(HomePageInitial()) {
    on<HomePageChangetTopic>(_changeTopic);
    on<HomePageGetWeatherInfomation>(_getWeatherInfomation);
    on<HomePageDeterminePosition>(_determinePosition);
    add(HomePageDeterminePosition());
  }

  Future<void> _changeTopic(
      HomePageChangetTopic event, Emitter<HomePageState> emit) async {
    try {
      emit(HomePageChangeTopicSuccess(topicSymbol: event.topicSymbol));
    } catch (e) {
      emit(HomePageFailure(message: e.toString()));
    }
  }

  Future<WeatherModel?> _getLocalWeatherData() async {
    try {
      final weatherBox = Hive.box(AppConstant.weatherBox);
      final weatherModel = weatherBox.get(AppConstant.weatherKey);
      return weatherModel;
    } catch (e) {
      return null;
    }
  }

  Future<WeatherModel> _fetchWeatherAPI(
    HomePageGetWeatherInfomation event,
  ) async {
    try {
      final weatherModel = await getWeatherUseCase.getWeatherInfo(
        GetWeatherParams(
          lon: event.long,
          lat: event.lat,
        ),
      );
      weatherModel.setDateTime(DateTimeService.now());
      // * write weather data to local
      final weatherBox = Hive.box(AppConstant.weatherBox);
      weatherBox.put(AppConstant.weatherKey, weatherModel);

      return weatherModel;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> _getWeatherInfomation(
    HomePageGetWeatherInfomation event,
    Emitter<HomePageState> emit,
  ) async {
    try {
      final localWeatherData = await _getLocalWeatherData();

      if (localWeatherData != null && localWeatherData.isSooner3HourThenNow()) {
        emit(HomePageGetWeatherInfomationSuccess(
            weatherModel: localWeatherData));
      } else {
        final remoteWeatherData = await _fetchWeatherAPI(event);

        emit(HomePageGetWeatherInfomationSuccess(
            weatherModel: remoteWeatherData));
      }
    } catch (e) {
      emit(HomePageFailure(message: e.toString()));
    }
  }

  Future<void> _determinePosition(
    HomePageDeterminePosition event,
    Emitter<HomePageState> emit,
  ) async {
    try {
      final position = await locationUseCase.call(NoParams());
      emit(HomePageDeterminePositionSuccess(position: position));
    } catch (e) {
      emit(HomePageFailure(message: e.toString()));
    }
  }
}
