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
import 'package:shared_preferences/shared_preferences.dart' as _i16;

import '../../features/auth/login/data/data_sources/remote/login_google_data_source.dart'
    as _i11;
import '../../features/auth/login/data/data_sources/remote/login_google_datasource_impl.dart'
    as _i10;
import '../../features/auth/login/data/repository_impl/login_google_repository_impl.dart'
    as _i13;
import '../../features/auth/login/domain/repositories/login_repository.dart'
    as _i12;
import '../../features/home/data/datasources/location_datasouce_impl.dart'
    as _i6;
import '../../features/home/data/datasources/location_datasource.dart' as _i5;
import '../../features/home/data/datasources/weather_datasource.dart' as _i17;
import '../../features/home/data/datasources/weather_datasource_impl.dart'
    as _i18;
import '../../features/home/data/repositories_impl/location_repository_impl.dart'
    as _i8;
import '../../features/home/data/repositories_impl/weather_repository_impl.dart'
    as _i20;
import '../../features/home/domain/repositories/location_repository.dart'
    as _i7;
import '../../features/home/domain/repositories/weather_repository.dart'
    as _i19;
import '../../features/home/domain/use_cases/location_use_case.dart' as _i9;
import '../../features/home/domain/use_cases/weather_use_case.dart' as _i21;
import '../../theme/color_theme.dart' as _i3;
import '../data/datasource/local/share_preference_datasource.dart' as _i14;
import '../data/datasource/local/share_preference_datasource_impl.dart' as _i15;
import '../data/defines/constants/image_constant.dart' as _i4;
import 'di.dart' as _i22;

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
  gh.singleton<_i5.LocationDataSource>(_i6.LocationDataSouceImpl());
  gh.singleton<_i7.LocationRepository>(
      _i8.LocationRepositoryImpl(gh<_i5.LocationDataSource>()));
  gh.singleton<_i9.LocationUseCase>(
      _i9.LocationUseCaseImpl(gh<_i7.LocationRepository>()));
  gh.singleton<_i10.LoginWithGoogleDataSource>(
      _i11.LoginWithGoogleDataSourceImpl());
  gh.factory<_i12.LoginWithGoogleRepository>(() =>
      _i13.LoginWithGoogleRepositoryImpl(gh<_i10.LoginWithGoogleDataSource>()));
  gh.factory<_i14.SharePreferenceDataSource>(
      () => _i15.SharePreferenceDataSouceImpl());
  await gh.factoryAsync<_i16.SharedPreferences>(
    () => appModule.sharedPreferences,
    preResolve: true,
  );
  gh.factory<_i17.WeatherDataSource>(() => _i18.WeatherDataSourceImpl());
  gh.factory<_i19.WeatherRepository>(
      () => _i20.WeatherRepositoryImpl(gh<_i17.WeatherDataSource>()));
  gh.singleton<_i21.GetWeatherUseCase>(
      _i21.GetWeatherUseCaseImpl(gh<_i19.WeatherRepository>()));
  return getIt;
}

class _$AppModule extends _i22.AppModule {}
