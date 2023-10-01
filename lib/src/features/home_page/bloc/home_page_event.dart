part of 'home_page_bloc.dart';

sealed class HomePageEvent extends Equatable {
  const HomePageEvent();

  @override
  List<Object> get props => [];
}

final class HomePageChangetTopic extends HomePageEvent {
  final int index;

  const HomePageChangetTopic({required this.index});
  @override
  List<Object> get props => [index];
}
