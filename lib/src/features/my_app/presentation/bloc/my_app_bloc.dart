import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_market/src/core/data/defines/constants/app_constant.dart';

part 'my_app_event.dart';
part 'my_app_state.dart';

class MyAppBloc extends Bloc<MyAppEvent, MyAppState> {
  MyAppBloc() : super(MyAppInitial()) {
    on<MyAppToggleTheme>(_toggleTheme);
    on<MyAppToggleLanguage>(_toggleLanguage);
    add(const MyAppToggleLanguage(languageCode: AppConstant.en));
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
