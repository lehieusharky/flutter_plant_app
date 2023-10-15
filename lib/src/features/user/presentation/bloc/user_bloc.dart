import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_market/src/features/user/domain/use_cases/image_picker_use_case.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<UserPickImageFromCamera>(_getImageFromCamera);
  }

  Future<void> _getImageFromCamera(
    UserPickImageFromCamera event,
    Emitter<UserState> emit,
  ) async {
    try {
      final image = await imagePickerUseCase.getImageFromCamera();
      emit(UserPickImageFromCameraSuccess(image: image));
    } catch (e) {
      emit(UserFailure(message: e.toString()));
    }
  }
}
