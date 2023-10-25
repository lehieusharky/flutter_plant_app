part of 'setting_bloc.dart';

sealed class SettingState extends Equatable {
  const SettingState();

  @override
  List<Object> get props => [];
}

final class SettingInitial extends SettingState {}

final class SettingLoading extends SettingState {}

final class SettingLogOutSuccess extends SettingState {}

final class SettingFailure extends SettingState {
  final String message;

  const SettingFailure({required this.message});

  @override
  List<Object> get props => [message];
}
