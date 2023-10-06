part of 'my_app_bloc.dart';

sealed class MyAppEvent extends Equatable {
  const MyAppEvent();

  @override
  List<Object> get props => [];
}

final class MyAppToggleTheme extends MyAppEvent {
  final ThemeMode themeMode;

  const MyAppToggleTheme({required this.themeMode});

  @override
  List<Object> get props => [themeMode];
}

final class MyAppToggleLanguage extends MyAppEvent {
  final String languageCode;

  const MyAppToggleLanguage({required this.languageCode});

  @override
  List<Object> get props => [languageCode];
}
