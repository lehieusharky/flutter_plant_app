import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:plant_market/src/core/failure/failure.dart';

abstract class SystemRepository {
  Either<SystemFailure, String> systemLanguage();
  Either<SystemFailure, ThemeMode> systemThemeMode();
}
