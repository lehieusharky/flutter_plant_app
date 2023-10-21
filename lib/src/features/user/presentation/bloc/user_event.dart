part of 'user_bloc.dart';

sealed class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

final class UserPickImageFromCamera extends UserEvent {}

final class UserGetListTimeLine extends UserEvent {
  final List<TimeLineModel> listTimeLineModel;

  const UserGetListTimeLine({required this.listTimeLineModel});

  @override
  List<Object> get props => [listTimeLineModel];
}

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
