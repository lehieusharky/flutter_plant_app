import 'dart:async';
import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_market/src/features/user/data/models/timeline_model.dart';
import 'package:plant_market/src/features/user/domain/use_cases/image_picker_use_case.dart';
import 'package:plant_market/src/features/user/domain/use_cases/timeline_use_case.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  StreamSubscription<List<TimeLineModel>>? _listTimeLineSubcription;

  UserBloc() : super(UserInitial()) {
    on<UserPickImageFromCamera>(_getImageFromCamera);
    on<UserCreateTimeLine>(_createTimeLine);
    on<UserPostTimeLineImage>(_postTimeLineImage);
    on<UserGetListTimeLine>(_getListTimeLine);
    on<UserCreatePlant>(_createPlant);
    on<UserToggleSelectPlant>(_togglePlant);
    // on<UserSubscribeListTimeLine>(_subscribeListTimeLine);

    _listTimeLineSubcription =
        timeLineUseCase.listTimeLineStream?.listen((listTimeLineData) {
      add(UserGetListTimeLine(listTimeLineModel: listTimeLineData));
    });
  }

  Future<void> _getListTimeLine(
    UserGetListTimeLine event,
    Emitter<UserState> emit,
  ) async {
    emit(UserLoading());

    try {
      emit(UserGetListTimeLineSuccess(listTimeLine: event.listTimeLineModel));
    } catch (e) {
      emit(UserFailure(message: e.toString()));
    }
  }

  Future<void> _togglePlant(
    UserToggleSelectPlant event,
    Emitter<UserState> emit,
  ) async {
    try {
      await timeLineUseCase.toggleSelectedPlant(plantName: event.plantName);
      emit(UserInitial());
      emit(UserToggleSelectPlantSuccess(plantName: event.plantName));
    } catch (e) {
      emit(UserFailure(message: e.toString()));
    }
  }

  Future<void> _createPlant(
    UserCreatePlant event,
    Emitter<UserState> emit,
  ) async {
    try {
      await timeLineUseCase.createPlant(plantName: event.plantName);
      emit(UserInitial());
      emit(UserCreatePlantSuccess(plantName: event.plantName));
    } catch (e) {
      emit(UserFailure(message: e.toString()));
    }
  }

  Future<void> _postTimeLineImage(
    UserPostTimeLineImage event,
    Emitter<UserState> emit,
  ) async {
    emit(UserLoading());
    try {
      final imageUrl =
          await timeLineUseCase.postImageOfTimeLine(image: event.image);

      emit(UserPostTimeLineImageSuccess(imageUrl: imageUrl ?? ''));
    } catch (e) {
      emit(UserFailure(message: e.toString()));
    }
  }

  Future<void> _createTimeLine(
    UserCreateTimeLine event,
    Emitter<UserState> emit,
  ) async {
    try {
      await timeLineUseCase.createTimeLine(timeLineModel: event.timeLineModel);
      emit(UserCreateTimeLineSuccess());
    } catch (e) {
      emit(UserFailure(message: e.toString()));
    }
  }

  Future<void> _getImageFromCamera(
    UserPickImageFromCamera event,
    Emitter<UserState> emit,
  ) async {
    try {
      final image = await imagePickerUseCase.getImageFromCamera();
      emit(UserPickImageFromCameraSuccess(image: image!));
    } catch (e) {
      emit(UserFailure(message: e.toString()));
    }
  }

  @override
  Future<void> close() {
    _listTimeLineSubcription?.cancel();
    return super.close();
  }
}
