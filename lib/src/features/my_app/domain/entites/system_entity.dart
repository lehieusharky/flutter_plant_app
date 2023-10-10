import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class SystemEntity extends Equatable {
  final String languageCode;
  final ThemeMode themeMode;

  const SystemEntity({required this.languageCode, required this.themeMode});
  @override
  List<Object?> get props => [languageCode, themeMode];
}
