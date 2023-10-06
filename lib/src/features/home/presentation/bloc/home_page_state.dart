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

final class HomePageFailure extends HomePageState {}
