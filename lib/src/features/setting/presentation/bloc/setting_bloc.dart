import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_market/src/features/setting/domain/use_cases/log_out_use_cases.dart';

part 'setting_event.dart';
part 'setting_state.dart';

class SettingBloc extends Bloc<SettingEvent, SettingState> {
  SettingBloc() : super(SettingInitial()) {
    on<SettingLogOut>(_logOut);
  }

  Future<void> _logOut(
    SettingLogOut event,
    Emitter<SettingState> emit,
  ) async {
    try {
      await logOutUseCase.logOut();
      emit(SettingLogOutSuccess());
    } catch (e) {
      emit(SettingFailure(message: e.toString()));
    }
  }
}
