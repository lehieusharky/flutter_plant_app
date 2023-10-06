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
