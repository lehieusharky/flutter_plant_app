// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i8;

import '../../theme/color_theme.dart' as _i3;
import '../constants.dart' as _i4;
import '../data/data_sources/remote/login_google_data_source.dart' as _i5;
import '../data/repository_impl/login_google_repository_impl.dart' as _i7;
import '../domain/repositories/login_repository.dart' as _i6;
import 'di.dart' as _i9;

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i1.GetIt> $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final appModule = _$AppModule();
  gh.factory<_i3.ColorTheme>(() => _i3.ColorThemeImpl());
  gh.factory<_i4.ImageConstant>(() => _i4.ImageConstantImpl());
  gh.singleton<_i5.LoginWithGoogleDataSource>(
      _i5.LoginWithGoogleDataSourceImpl());
  gh.factory<_i6.LoginWithGoogleRepository>(
      () => _i7.LoginWithGoogleRepositoryImpl());
  await gh.factoryAsync<_i8.SharedPreferences>(
    () => appModule.sharedPreferences,
    preResolve: true,
  );
  return getIt;
}

class _$AppModule extends _i9.AppModule {}
