part of 'user_bloc.dart';

sealed class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

final class UserInitial extends UserState {}

final class UserPickImageFromCameraSuccess extends UserState {
  final File image;

  const UserPickImageFromCameraSuccess({required this.image});

  @override
  List<Object> get props => [image];
}

final class UserPostTimeLineImageSuccess extends UserState {
  final String imageUrl;

  const UserPostTimeLineImageSuccess({required this.imageUrl});

  @override
  List<Object> get props => [imageUrl];
}

final class UserCreateTimeLineSuccess extends UserState {
  final TimeLineModel timeLineModel;

  const UserCreateTimeLineSuccess({required this.timeLineModel});

  @override
  List<Object> get props => [timeLineModel];
}

final class UserLoading extends UserState {}

final class UserGetListTimeLineSuccess extends UserState {
  final List<TimeLineModel> listTimeLine;

  const UserGetListTimeLineSuccess({required this.listTimeLine});

  @override
  List<Object> get props => [listTimeLine];
}

final class UserFailure extends UserState {
  final String message;

  const UserFailure({required this.message});

  @override
  List<Object> get props => [message];
}

final class UserCreatePlantSuccess extends UserState {
  final String plantName;

  const UserCreatePlantSuccess({required this.plantName});

  @override
  List<Object> get props => [plantName];
}

final class UserToggleSelectPlantSuccess extends UserState {
  final String plantName;

  const UserToggleSelectPlantSuccess({required this.plantName});

  @override
  List<Object> get props => [plantName];
}
