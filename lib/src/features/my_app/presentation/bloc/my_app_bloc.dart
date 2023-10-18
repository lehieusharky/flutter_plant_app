import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_market/src/core/data/datasource/local/share_preference_datasource.dart';
import 'package:plant_market/src/core/data/defines/enum/supported_theme.dart';
import 'package:plant_market/src/core/data/models/user_model.dart';
import 'package:plant_market/src/features/my_app/data/models/system_model.dart';
import 'package:plant_market/src/features/my_app/domain/use_cases/system_use_case.dart';

part 'my_app_event.dart';
part 'my_app_state.dart';

class MyAppBloc extends Bloc<MyAppEvent, MyAppState> {
  MyAppBloc() : super(MyAppInitial()) {
    on<MyAppToogleTheme>(_toggleTheme);
    on<MyAppToggleLanguage>(_toggleLanguage);
    on<MyAppGetSystemInfomation>(_getSystemInfomation);
    on<MyAppGetUserInformation>(_getUserInformation);
    add(MyAppGetSystemInfomation());
  }

  Future<void> _getUserInformation(
    MyAppGetUserInformation event,
    Emitter<MyAppState> emit,
  ) async {
    try {
      emit(MyAppGetUserInformationSuccess(userModel: event.userModel));
    } catch (e) {
      emit(MyAppFailure(message: e.toString()));
    }
  }

  Future<void> _getSystemInfomation(
    MyAppGetSystemInfomation event,
    Emitter<MyAppState> emit,
  ) async {
    try {
      String languageCode = '';
      ThemeMode themeMode = ThemeMode.light;
      final isFirstTime = sharePreference.isFirstTimeOpenApp();

      if (isFirstTime) {
        languageCode = systemUseCase.getSystemLanguage();
        themeMode = systemUseCase.getSystemThemeMode();
        sharePreference.setIsFirstTimeOpenApp();
      } else {
        languageCode = sharePreference.getLanguage();
        themeMode = sharePreference.getTheme() == SupportedTheme.light
            ? ThemeMode.light
            : ThemeMode.dark;
      }

      final systemModel =
          SystemModel(languageCode: languageCode, themeMode: themeMode);

      emit(MyAppGetSystemInfomationSuccess(systemModel: systemModel));
    } catch (e) {
      emit(MyAppFailure(message: e.toString()));
    }
  }

  Future<void> _toggleLanguage(
    MyAppToggleLanguage event,
    Emitter<MyAppState> emit,
  ) async {
    try {
      emit(MyAppToggleLanguageSuccess(languageCode: event.languageCode));
    } catch (e) {
      emit(MyAppFailure(message: e.toString()));
    }
  }

  Future<void> _toggleTheme(
    MyAppToogleTheme event,
    Emitter<MyAppState> emit,
  ) async {
    try {
      emit(MyAppToggleThemeSuccess(themeMode: event.themeMode));
    } catch (e) {
      emit(MyAppFailure(message: e.toString()));
    }
  }
}
