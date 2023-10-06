part of 'my_app_bloc.dart';

sealed class MyAppState extends Equatable {
  const MyAppState();

  @override
  List<Object> get props => [];
}

final class MyAppInitial extends MyAppState {}

final class MyAppToggleThemeSuccess extends MyAppState {
  final ThemeMode themeMode;

  const MyAppToggleThemeSuccess({required this.themeMode});
  @override
  List<Object> get props => [themeMode];
}

final class MyAppToggleLanguageSuccess extends MyAppState {
  final String languageCode;

  const MyAppToggleLanguageSuccess({required this.languageCode});
  @override
  List<Object> get props => [languageCode];
}

final class MyAppFailure extends MyAppState {
  final String message;

  const MyAppFailure({required this.message});
  @override
  List<Object> get props => [message];
}