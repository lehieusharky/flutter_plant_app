import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_market/src/core/data/models/user_model.dart';
import 'package:plant_market/src/core/domain/user_cases/user_use_cases.dart';

part 'dash_board_event.dart';
part 'dash_board_state.dart';

class DashBoardBloc extends Bloc<DashBoardEvent, DashBoardState> {
  StreamSubscription<UserModel?>? _userInfomationSubscription;

  DashBoardBloc() : super(DashBoardInitial()) {
    on<DashBoardGetUserInfomation>(_listenUserInformation);

    _userInfomationSubscription =
        userUseCase.userInformationStream?.listen((userInfomation) {
      add(DashBoardGetUserInfomation(userModel: userInfomation!));
    });
  }

  Future<void> _listenUserInformation(
    DashBoardGetUserInfomation event,
    Emitter<DashBoardState> emit,
  ) async {
    try {
      emit(DashBoardGetUserInfomationSuccess(userModel: event.userModel));
    } catch (e) {
      emit(DashBoardFailure(message: e.toString()));
    }
  }

  @override
  Future<void> close() {
    _userInfomationSubscription?.cancel();
    return super.close();
  }
}
