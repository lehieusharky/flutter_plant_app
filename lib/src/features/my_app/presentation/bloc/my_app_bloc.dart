import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_market/src/core/data/defines/constants/app_constant.dart';
import 'package:plant_market/src/features/my_app/domain/use_cases/system_use_case.dart';

part 'my_app_event.dart';
part 'my_app_state.dart';

class MyAppBloc extends Bloc<MyAppEvent, MyAppState> {
  MyAppBloc() : super(MyAppInitial()) {
    on<MyAppToggleTheme>(_toggleTheme);
    on<MyAppToggleLanguage>(_toggleLanguage);
    on<MyAppGetSystemLanguage>(_getSystemLanguage);
    on<MyAppGetSystemTheme>(_getSystemThemeMode);
    add(const MyAppToggleLanguage(languageCode: AppConstant.en));
  }

  Future<void> _getSystemLanguage(
    MyAppGetSystemLanguage event,
    Emitter<MyAppState> emit,
  ) async {
    try {
      final languageCode = systemUseCase.getSystemLanguage();
      emit(MyAppGetSystemLanguageSuccess(languageCode: languageCode));
    } catch (e) {
      emit(MyAppFailure(message: e.toString()));
    }
  }

  Future<void> _getSystemThemeMode(
    MyAppGetSystemTheme event,
    Emitter<MyAppState> emit,
  ) async {
    try {
      final themeMode = systemUseCase.getSystemThemeMode();
      emit(MyAppGetSystemThemeSuccess(themeMode: themeMode));
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
    MyAppToggleTheme event,
    Emitter<MyAppState> emit,
  ) async {
    try {
      emit(MyAppToggleThemeSuccess(themeMode: event.themeMode));
    } catch (e) {
      emit(MyAppFailure(message: e.toString()));
    }
  }
}
