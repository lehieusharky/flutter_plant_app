part of 'home_page_bloc.dart';

sealed class HomePageState extends Equatable {
  const HomePageState();

  @override
  List<Object> get props => [];
}

final class HomePageInitial extends HomePageState {}

final class HomePageChangeTopicSuccess extends HomePageState {
  final int isChoosed;

  const HomePageChangeTopicSuccess({required this.isChoosed});
  @override
  List<Object> get props => [isChoosed];
}

final class HomePageFailure extends HomePageState {}
