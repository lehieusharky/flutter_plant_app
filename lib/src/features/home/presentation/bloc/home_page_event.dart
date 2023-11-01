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



final class HomePagePostCommunityPostImage extends HomePageEvent {
  final File imageFile;

  const HomePagePostCommunityPostImage({required this.imageFile});

  @override
  List<Object> get props => [imageFile];
}

final class HomePageCreateCommunityPost extends HomePageEvent {
  final CommunityPostModel communityPostModel;
  final int number;

  const HomePageCreateCommunityPost({
    required this.communityPostModel,
    required this.number,
  });

  @override
  List<Object> get props => [communityPostModel, number];
}

final class HomePageGetListCommunityPost extends HomePageEvent {
  final int num;

  const HomePageGetListCommunityPost({required this.num});

  @override
  List<Object> get props => [num];
}

final class HomePageGetCommunityInformation extends HomePageEvent {}

final class HomePageAddFavoriteCommunityPost extends HomePageEvent {
  final String communityPostId;

  const HomePageAddFavoriteCommunityPost({required this.communityPostId});
  @override
  List<Object> get props => [communityPostId];
}

final class HomePageRemoveFavoriteCommunityPost extends HomePageEvent {
  final String communityPostId;

  const HomePageRemoveFavoriteCommunityPost({required this.communityPostId});
  @override
  List<Object> get props => [communityPostId];
}
