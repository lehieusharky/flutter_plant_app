import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_market/src/core/use_cases/use_case.dart';
import 'package:plant_market/src/features/home/data/enum/topic_symbol.dart';
import 'package:plant_market/src/features/home/data/models/weather_model.dart';
import 'package:plant_market/src/features/home/domain/use_cases/get_weather_use_case.dart';
part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc() : super(HomePageInitial()) {
    on<HomePageChangetTopic>(_changeTopic);
    on<HomePageGetWeatherInfomation>(_getWeatherInfomation);
    add(const HomePageGetWeatherInfomation(
      lat: '10.783935307501704',
      lon: '106.69827831543994',
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
      final weatherModel = await getWeatherUseCase.call(GetWeatherParams(
        lon: event.lon,
        lat: event.lat,
      ));

      emit(HomePageGetWeatherInfomationSuccess(weatherModel: weatherModel));
    } catch (e) {
      emit(HomePageFailure(message: e.toString()));
    }
  }
}
