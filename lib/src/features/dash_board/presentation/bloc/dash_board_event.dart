part of 'dash_board_bloc.dart';

sealed class DashBoardEvent extends Equatable {
  const DashBoardEvent();

  @override
  List<Object> get props => [];
}

final class DashBoardGetUserInfomation extends DashBoardEvent {
  final UserModel userModel;

  const DashBoardGetUserInfomation({required this.userModel});

  @override
  List<Object> get props => [userModel];
}

final class DashBoardGetLoggedInNotification extends DashBoardEvent {}

