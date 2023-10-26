part of 'home_page_bloc.dart';

sealed class HomePageEvent extends Equatable {
  const HomePageEvent();

  @override
  List<Object> get props => [];
}

final class HomePageChangetTopic extends HomePageEvent {
  final TopicSymbol topicSymbol;

  const HomePageChangetTopic({required this.topicSymbol});
  @override
  List<Object> get props => [topicSymbol];
}

final class HomePageGetWeatherInfomation extends HomePageEvent {
  final String lat;
  final String long;

  const HomePageGetWeatherInfomation({
    required this.lat,
    required this.long,
  });

  @override
  List<Object> get props => [lat, long];
}

final class HomePageDeterminePosition extends HomePageEvent {}

final class HomePagePickImageFromCamera extends HomePageEvent {}

final class HomePageGetImageFromGallery extends HomePageEvent {}

final class HomePagePostImageToPublicGallery extends HomePageEvent {
  final File imageFile;

  const HomePagePostImageToPublicGallery({required this.imageFile});

  @override
  List<Object> get props => [imageFile];
}
