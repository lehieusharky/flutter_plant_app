part of 'popular_topic_bloc.dart';

sealed class PopularTopicState extends Equatable {
  const PopularTopicState();

  @override
  List<Object> get props => [];
}

final class PopularTopicInitial extends PopularTopicState {}
