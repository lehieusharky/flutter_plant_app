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
import 'package:shared_preferences/shared_preferences.dart' as _i22;

import '../../features/auth/login/data/data_sources/remote/login_google_datasource.dart'
    as _i11;
import '../../features/auth/login/data/data_sources/remote/login_google_datasource_impl.dart'
    as _i10;
import '../../features/auth/login/data/data_sources/remote/phone_datasource.dart'
    as _i15;
import '../../features/auth/login/data/data_sources/remote/phone_datasource_impl.dart'
    as _i16;
import '../../features/auth/login/data/repository_impl/login_google_repository_impl.dart'
    as _i13;
import '../../features/auth/login/data/repository_impl/phone_repository_impl.dart'
    as _i18;
import '../../features/auth/login/domain/repositories/login_repository.dart'
    as _i12;
import '../../features/auth/login/domain/repositories/phone_repository.dart'
    as _i17;
import '../../features/auth/login/domain/use_cases/login_google_usecase.dart'
    as _i14;
import '../../features/auth/login/domain/use_cases/phone_usecase.dart' as _i19;
import '../../features/home/data/datasources/location_datasouce_impl.dart'
    as _i6;
import '../../features/home/data/datasources/location_datasource.dart' as _i5;
import '../../features/home/data/datasources/weather_datasource.dart' as _i23;
import '../../features/home/data/datasources/weather_datasource_impl.dart'
    as _i24;
import '../../features/home/data/repositories_impl/location_repository_impl.dart'
    as _i8;
import '../../features/home/data/repositories_impl/weather_repository_impl.dart'
    as _i26;
import '../../features/home/domain/repositories/location_repository.dart'
    as _i7;
import '../../features/home/domain/repositories/weather_repository.dart'
    as _i25;
import '../../features/home/domain/use_cases/location_use_case.dart' as _i9;
import '../../features/home/domain/use_cases/weather_use_case.dart' as _i27;
import '../../theme/color_theme.dart' as _i3;
import '../data/datasource/local/share_preference_datasource.dart' as _i20;
import '../data/datasource/local/share_preference_datasource_impl.dart' as _i21;
import '../data/defines/constants/image_constant.dart' as _i4;
import 'di.dart' as _i28;

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
  gh.factory<_i10.LoginWithGoogleDataSource>(
      () => _i11.LoginWithGoogleDataSourceImpl());
  gh.factory<_i12.LoginWithGoogleRepository>(() =>
      _i13.LoginWithGoogleRepositoryImpl(gh<_i10.LoginWithGoogleDataSource>()));
  gh.factory<_i14.LoginWithGoogleUseCase>(() =>
      _i14.LoginWithGoogleUseCaseImpl(gh<_i12.LoginWithGoogleRepository>()));
  gh.factory<_i15.PhoneDataSource>(() => _i16.PhoneDataSouceImpl());
  gh.factory<_i17.PhoneRepository>(
      () => _i18.PhoneRepositoryImpl(gh<_i15.PhoneDataSource>()));
  gh.factory<_i19.PhoneUseCase>(
      () => _i19.PhoneUsecaseimpl(gh<_i17.PhoneRepository>()));
  gh.factory<_i20.SharePreferenceDataSource>(
      () => _i21.SharePreferenceDataSouceImpl());
  await gh.factoryAsync<_i22.SharedPreferences>(
    () => appModule.sharedPreferences,
    preResolve: true,
  );
  gh.factory<_i23.WeatherDataSource>(() => _i24.WeatherDataSourceImpl());
  gh.factory<_i25.WeatherRepository>(
      () => _i26.WeatherRepositoryImpl(gh<_i23.WeatherDataSource>()));
  gh.singleton<_i27.GetWeatherUseCase>(
      _i27.GetWeatherUseCaseImpl(gh<_i25.WeatherRepository>()));
  return getIt;
}

class _$AppModule extends _i28.AppModule {}
