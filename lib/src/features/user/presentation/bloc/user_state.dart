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

final class UserCreateTimeLineSuccess extends UserState {}

final class UserFailure extends UserState {
  final String message;

  const UserFailure({required this.message});

  @override
  List<Object> get props => [message];
}
