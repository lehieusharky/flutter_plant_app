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

final class UserChooseSection extends UserEvent {
  final UserPageSection userPageSection;

  const UserChooseSection({required this.userPageSection});

  @override
  List<Object> get props => [userPageSection];
}

final class UserCreateTimeLine extends UserEvent {
  final TimeLineModel timeLineModel;

  const UserCreateTimeLine({
    required this.timeLineModel,
  });

  @override
  List<Object> get props => [timeLineModel];
}

final class UserUpdateTimeLine extends UserEvent {
  final TimeLineModel timeLineModel;

  const UserUpdateTimeLine({
    required this.timeLineModel,
  });

  @override
  List<Object> get props => [timeLineModel];
}

final class UserCreatePlant extends UserEvent {
  final String plantName;

  const UserCreatePlant({required this.plantName});

  @override
  List<Object> get props => [plantName];
}

final class UserToggleSelectPlant extends UserEvent {
  final String plantName;

  const UserToggleSelectPlant({required this.plantName});

  @override
  List<Object> get props => [plantName];
}

final class UserGetListTimeLine extends UserEvent {
  final String plantName;

  const UserGetListTimeLine({required this.plantName});

  @override
  List<Object> get props => [plantName];
}
