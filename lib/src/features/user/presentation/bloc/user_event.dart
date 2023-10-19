part of 'user_bloc.dart';

sealed class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

final class UserPickImageFromCamera extends UserEvent {}

final class UserPostTimeLineImage extends UserEvent {
  final File image;

  const UserPostTimeLineImage({required this.image});

  @override
  List<Object> get props => [image];
}

final class UserCreateTimeLine extends UserEvent {
  final TimeLineModel timeLineModel;

  const UserCreateTimeLine({required this.timeLineModel});

  @override
  List<Object> get props => [timeLineModel];
}
