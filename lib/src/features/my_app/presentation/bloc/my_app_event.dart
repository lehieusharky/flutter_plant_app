part of 'my_app_bloc.dart';

sealed class MyAppEvent extends Equatable {
  const MyAppEvent();

  @override
  List<Object> get props => [];
}

final class MyAppToogleTheme extends MyAppEvent {
  final ThemeMode themeMode;

  const MyAppToogleTheme({required this.themeMode});

  @override
  List<Object> get props => [themeMode];
}

final class MyAppToggleLanguage extends MyAppEvent {
  final String languageCode;

  const MyAppToggleLanguage({required this.languageCode});

  @override
  List<Object> get props => [languageCode];
}

final class MyAppGetSystemInfomation extends MyAppEvent {}


// - time:
//   + fist time: 
//     + event: get ThemeLanguage
//     + state: getThemeLanguage

//   + during :
//     + event: toggle theme, language
//     + state: getTheme, getLanguage

