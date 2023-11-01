import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hive/hive.dart';
import 'package:plant_market/src/core/data/defines/constants/app_constant.dart';
import 'package:plant_market/src/core/services/date_time_service.dart';
import 'package:plant_market/src/core/use_cases/use_case.dart';
import 'package:plant_market/src/features/home/data/enum/topic_symbol.dart';
import 'package:plant_market/src/features/home/data/models/community_model.dart';
import 'package:plant_market/src/features/home/data/models/community_post_model.dart';
import 'package:plant_market/src/features/home/data/models/weather_model.dart';
import 'package:plant_market/src/features/home/domain/use_cases/community_usecase.dart';
import 'package:plant_market/src/features/home/domain/use_cases/location_use_case.dart';
import 'package:plant_market/src/features/home/domain/use_cases/weather_use_case.dart';
import 'package:plant_market/src/features/user/domain/use_cases/image_picker_use_case.dart';
part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc() : super(HomePageInitial()) {
    on<HomePageChangetTopic>(_changeTopic);
    on<HomePageGetWeatherInfomation>(_getWeatherInfomation);
    on<HomePageDeterminePosition>(_determinePosition);
    on<HomePagePickImageFromCamera>(_pickImageFromCamera);
    on<HomePageCreateCommunityPost>(_createCommunityPost);
    on<HomePagePostCommunityPostImage>(_postCommunityPostImage);
    on<HomePageGetListCommunityPost>(_getListCommunityPost);
    on<HomePageGetCommunityInformation>(_getCommunityInformation);
    on<HomePageAddFavoriteCommunityPost>(_addFavoriteCommunityPost);
    on<HomePageRemoveFavoriteCommunityPost>(_removeFavoriteCommunityPost);
    add(HomePageDeterminePosition());
    add(const HomePageGetListCommunityPost(num: 5));
    add(HomePageGetCommunityInformation());
  }

  Future<void> _getCommunityInformation(HomePageGetCommunityInformation event,
      Emitter<HomePageState> emit) async {
    try {
      final communityModel = await communityUseCase.getCommunityInformation();
      emit(HomePageInitial());

      emit(HomePageGetCommunityInfoSuccess(communityModel: communityModel));
    } catch (e) {
      emit(HomePageFailure(message: e.toString()));
    }
  }

  Future<void> _addFavoriteCommunityPost(HomePageAddFavoriteCommunityPost event,
      Emitter<HomePageState> emit) async {
    try {
      await communityUseCase.addToFavoritePost(
          communityPostId: event.communityPostId);
      emit(HomePageInitial());
      emit(HomePageAddFavoriteCommunityPostSuccess());
    } catch (e) {
      emit(HomePageFailure(message: e.toString()));
    }
  }

  Future<void> _removeFavoriteCommunityPost(
      HomePageRemoveFavoriteCommunityPost event,
      Emitter<HomePageState> emit) async {
    try {
      await communityUseCase.removeFromFavoritePost(
          communityPostId: event.communityPostId);

      emit(HomePageRemoveFavoriteCommunityPostSuccess());
    } catch (e) {
      emit(HomePageFailure(message: e.toString()));
    }
  }

  Future<void> _getListCommunityPost(
      HomePageGetListCommunityPost event, Emitter<HomePageState> emit) async {
    try {
      final listCommunityPost =
          await communityUseCase.getListCommunityPost(num: event.num);

      emit(HomePageGetCommunityPostListSuccess(
          listCommunityPost: listCommunityPost));
    } catch (e) {
      emit(HomePageFailure(message: e.toString()));
    }
  }

  Future<void> _createCommunityPost(
      HomePageCreateCommunityPost event, Emitter<HomePageState> emit) async {
    try {
      await communityUseCase.createCommunityPost(
        communityPostModel: event.communityPostModel,
        number: event.number,
      );
      emit(HomePageCreateCommunityPostSuccess(
          communityPostModel: event.communityPostModel));
    } catch (e) {
      emit(HomePageFailure(message: e.toString()));
    }
  }

  Future<void> _pickImageFromCamera(
      HomePagePickImageFromCamera event, Emitter<HomePageState> emit) async {
    try {
      final imageFile = await imagePickerUseCase.getImageFromCamera();
      if (imageFile != null) {
        emit(HomePagePickImageFromCameraSuccess(imageFile: imageFile));
      } else {
        emit(const HomePagePickImageFailed(message: 'Take image failed'));
      }
    } catch (e) {
      emit(HomePageFailure(message: e.toString()));
    }
  }

  Future<void> _postCommunityPostImage(
    HomePagePostCommunityPostImage event,
    Emitter<HomePageState> emit,
  ) async {
    emit(HomePageLoading());
    try {
      final imageUrl = await communityUseCase.postCommunityPostImage(
          imageFile: event.imageFile);

      if (imageUrl != null) {
        emit(HomePagePostCommunityPostImageSuccess(imageUrl: imageUrl));
      } else {
        emit(const HomePageFailure(message: 'post failed'));
      }
    } catch (e) {
      emit(HomePageFailure(message: e.toString()));
    }
  }


  Future<void> _changeTopic(
      HomePageChangetTopic event, Emitter<HomePageState> emit) async {
    try {
      emit(HomePageInitial());
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
