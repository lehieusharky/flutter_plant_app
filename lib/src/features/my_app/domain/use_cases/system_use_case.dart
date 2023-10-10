import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:plant_market/src/core/data/defines/constants/app_constant.dart';
import 'package:plant_market/src/core/di/di.dart';
import 'package:plant_market/src/core/failure/failure.dart';
import 'package:plant_market/src/core/use_cases/use_case.dart';
import 'package:plant_market/src/features/my_app/domain/repositories/system_repository.dart';

SystemUsecase get systemUseCase => injector.get<SystemUsecase>();

abstract class SystemUsecase {
  String getSystemLanguage();
  ThemeMode getSystemThemeMode();
}

@Injectable(as: SystemUsecase)
class SystemUsecaseImpl extends UseCase<String, NoParams>
    implements SystemUsecase {
  final SystemRepository _systemRepository;

  SystemUsecaseImpl(this._systemRepository);

  @override
  Future<String> call(NoParams params) async {
    return 'a';
  }

  @override
  String getSystemLanguage() {
    try {
      final result = _systemRepository.systemLanguage();
      return result.fold(
        (failure) {
          Logger().e(failure.message);
          return AppConstant.en;
        },
        (languageCode) => languageCode,
      );
    } catch (e) {
      throw SystemFailure(message: e.toString());
    }
  }

  @override
  ThemeMode getSystemThemeMode() {
    try {
      final result = _systemRepository.systemThemeMode();
      return result.fold(
        (failure) {
          Logger().e(failure.message);
          return ThemeMode.light;
        },
        (themeMode) => themeMode,
      );
    } catch (e) {
      throw SystemFailure(message: e.toString());
    }
  }
}
