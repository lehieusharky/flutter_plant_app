part of 'home_page_bloc.dart';

sealed class HomePageState extends Equatable {
  const HomePageState();

  @override
  List<Object> get props => [];
}

final class HomePageInitial extends HomePageState {}

final class HomePageChangeTopicSuccess extends HomePageState {
  final TopicSymbol topicSymbol;

  const HomePageChangeTopicSuccess({required this.topicSymbol});

  @override
  List<Object> get props => [topicSymbol];
}

final class HomePageFailure extends HomePageState {
  final String message;

  const HomePageFailure({required this.message});

  @override
  List<Object> get props => [message];
}

final class HomePageGetWeatherInfomationSuccess extends HomePageState {
  final WeatherModel weatherModel;
  const HomePageGetWeatherInfomationSuccess({required this.weatherModel});

  @override
  List<Object> get props => [weatherModel];
}

final class HomePagePickImageFromCameraSuccess extends HomePageState {
  final File imageFile;

  const HomePagePickImageFromCameraSuccess({required this.imageFile});

  @override
  List<Object> get props => [imageFile];
}

final class HomePageDeterminePositionSuccess extends HomePageState {
  final Position? position;
  const HomePageDeterminePositionSuccess({required this.position});
}

final class HomePagePickImageFailed extends HomePageState {
  final String message;

  const HomePagePickImageFailed({required this.message});
  @override
  List<Object> get props => [message];
}

final class HomePageGetImageFromGallerySuccess extends HomePageState {
  final List<String> gallery;

  const HomePageGetImageFromGallerySuccess({required this.gallery});
  @override
  List<Object> get props => [gallery];
}

final class HomePagePostImageToPublicGallerySuccess extends HomePageState {}

final class HomePagePostCommunityPostImageSuccess extends HomePageState {
  final String imageUrl;

  const HomePagePostCommunityPostImageSuccess({required this.imageUrl});

  @override
  List<Object> get props => [imageUrl];
}

final class HomePageCreateCommunityPostSuccess extends HomePageState {}

final class HomePageGetCommunityPostListSuccess extends HomePageState {
  final List<CommunityPostModel> listCommunityPost;

  const HomePageGetCommunityPostListSuccess({required this.listCommunityPost});

  @override
  List<Object> get props => [listCommunityPost];
}
