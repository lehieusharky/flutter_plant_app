import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_market/src/core/data/datasource/local/share_preference_datasource.dart';
import 'package:plant_market/src/core/data/defines/constants/app_constant.dart';
import 'package:plant_market/src/core/domain/user_cases/user_use_cases.dart';
import 'package:plant_market/src/features/setting/domain/use_cases/log_out_use_cases.dart';

part 'setting_event.dart';
part 'setting_state.dart';

class SettingBloc extends Bloc<SettingEvent, SettingState> {
  SettingBloc() : super(SettingInitial()) {
    on<SettingLogOut>(_logOut);
    on<SettingDeleteAccount>(_deleteAccount);
  }

  Future<void> _logOut(
    SettingLogOut event,
    Emitter<SettingState> emit,
  ) async {
    emit(SettingLoading());
    try {
      await logOutUseCase.logOut();
      await sharePreference.setUserId(userId: AppConstant.isNull);
      emit(SettingLogOutSuccess());
    } catch (e) {
      emit(SettingFailure(message: e.toString()));
    }
  }

  Future<void> _deleteAccount(
    SettingDeleteAccount event,
    Emitter<SettingState> emit,
  ) async {
    emit(SettingLoading());
    try {
      await userUseCase.deleteUserDataBase();
      emit(SettingDeleteAccountSuccess());
    } catch (e) {
      emit(SettingFailure(message: e.toString()));
    }
  }
}
