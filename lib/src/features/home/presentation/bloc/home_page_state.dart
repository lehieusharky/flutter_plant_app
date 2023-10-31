part of 'home_page_bloc.dart';

sealed class HomePageState extends Equatable {
  const HomePageState();

  @override
  List<Object> get props => [];
}

final class HomePageInitial extends HomePageState {}

final class HomePageLoading extends HomePageState {}

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
final class HomePagePostCommunityPostImageSuccess extends HomePageState {
  final String imageUrl;

  const HomePagePostCommunityPostImageSuccess({required this.imageUrl});

  @override
  List<Object> get props => [imageUrl];
}

final class HomePageCreateCommunityPostSuccess extends HomePageState {
  final CommunityPostModel communityPostModel;

  const HomePageCreateCommunityPostSuccess({required this.communityPostModel});
  @override
  List<Object> get props => [communityPostModel];
}

final class HomePageGetCommunityPostListSuccess extends HomePageState {
  final List<CommunityPostModel> listCommunityPost;

  const HomePageGetCommunityPostListSuccess({
    required this.listCommunityPost,
  });

  @override
  List<Object> get props => [listCommunityPost];
}

final class HomePageGetCommunityInfoSuccess extends HomePageState {
  final CommunityModel communityModel;

  const HomePageGetCommunityInfoSuccess({
    required this.communityModel,
  });

  @override
  List<Object> get props => [communityModel];
}

final class HomePageAddFavoriteCommunityPostSuccess extends HomePageState {}

final class HomePageRemoveFavoriteCommunityPostSuccess extends HomePageState {}
