part of 'dash_board_bloc.dart';

sealed class DashBoardState extends Equatable {
  const DashBoardState();

  @override
  List<Object> get props => [];
}

final class DashBoardInitial extends DashBoardState {}

final class DashBoardGetUserInfomationSuccess extends DashBoardState {
  final UserModel userModel;

  const DashBoardGetUserInfomationSuccess({required this.userModel});

  @override
  List<Object> get props => [userModel];
}

final class DashBoardFailure extends DashBoardState {
  final String message;

  const DashBoardFailure({required this.message});

  @override
  List<Object> get props => [message];
}
