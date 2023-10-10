import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:plant_market/src/core/failure/failure.dart';
import 'package:plant_market/src/features/my_app/data/datasources/local/system_datasource.dart';
import 'package:plant_market/src/features/my_app/domain/repositories/system_repository.dart';

@Injectable(as: SystemRepository)
class SystemRepositoryImpl implements SystemRepository {
  final SystemDataSource _systemDataSource;

  SystemRepositoryImpl(this._systemDataSource);

  @override
  Either<SystemFailure, String> systemLanguage() {
    try {
      final languageCode = _systemDataSource.systemLanguage();
      return Right(languageCode);
    } catch (e) {
      return Left(SystemFailure(message: e.toString()));
    }
  }

  @override
  Either<SystemFailure, ThemeMode> systemThemeMode() {
    try {
      final themeMode = _systemDataSource.systemThemeMode();
      return Right(themeMode);
    } catch (e) {
      return Left(SystemFailure(message: e.toString()));
    }
  }
}
