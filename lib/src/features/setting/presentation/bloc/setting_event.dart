part of 'setting_bloc.dart';

sealed class SettingEvent extends Equatable {
  const SettingEvent();

  @override
  List<Object> get props => [];
}

final class SettingLogOut extends SettingEvent {}

final class SettingDeleteAccount extends SettingEvent {}