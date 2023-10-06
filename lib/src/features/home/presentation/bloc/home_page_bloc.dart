import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_market/src/features/home/data/enum/topic_symbol.dart';
import 'package:plant_market/src/features/home/data/models/weather_model.dart';
import 'package:plant_market/src/features/home/domain/repositories/get_weather_repository.dart';
part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc() : super(HomePageInitial()) {
    on<HomePageChangetTopic>(_changeTopic);
    on<HomePageGetWeatherInfomation>(_getWeatherInfomation);
    add(const HomePageGetWeatherInfomation(
      lat: '10.805309377598595',
      lon: '106.69564860073011',
    ));
  }

  Future<void> _changeTopic(
      HomePageChangetTopic event, Emitter<HomePageState> emit) async {
    try {
      emit(HomePageChangeTopicSuccess(topicSymbol: event.topicSymbol));
    } catch (e) {
      emit(HomePageFailure(message: e.toString()));
    }
  }

  Future<void> _getWeatherInfomation(
    HomePageGetWeatherInfomation event,
    Emitter<HomePageState> emit,
  ) async {
    try {
      final weatherData = await getWeatherRepository.getWeatherInfo(
        lat: event.lat,
        lon: event.lon,
      );
      weatherData.fold(
        (failure) => emit(HomePageFailure(message: failure.message)),
        (weatherModel) => emit(
            HomePageGetWeatherInfomationSuccess(weatherModel: weatherModel)),
      );
    } catch (e) {
      emit(HomePageFailure(message: e.toString()));
    }
  }
}
