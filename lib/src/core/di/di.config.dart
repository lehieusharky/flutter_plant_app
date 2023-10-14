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
import 'package:shared_preferences/shared_preferences.dart' as _i28;

import '../../features/auth/login/data/data_sources/remote/login_google_datasource.dart'
    as _i17;
import '../../features/auth/login/data/data_sources/remote/login_google_datasource_impl.dart'
    as _i16;
import '../../features/auth/login/data/data_sources/remote/phone_datasource.dart'
    as _i21;
import '../../features/auth/login/data/data_sources/remote/phone_datasource_impl.dart'
    as _i22;
import '../../features/auth/login/data/repository_impl/login_google_repository_impl.dart'
    as _i19;
import '../../features/auth/login/data/repository_impl/phone_repository_impl.dart'
    as _i24;
import '../../features/auth/login/domain/repositories/login_repository.dart'
    as _i18;
import '../../features/auth/login/domain/repositories/phone_repository.dart'
    as _i23;
import '../../features/auth/login/domain/use_cases/login_google_usecase.dart'
    as _i20;
import '../../features/auth/login/domain/use_cases/phone_usecase.dart' as _i25;
import '../../features/home/data/datasources/location_datasouce_impl.dart'
    as _i7;
import '../../features/home/data/datasources/location_datasource.dart' as _i6;
import '../../features/home/data/datasources/weather_datasource.dart' as _i34;
import '../../features/home/data/datasources/weather_datasource_impl.dart'
    as _i35;
import '../../features/home/data/repositories_impl/location_repository_impl.dart'
    as _i9;
import '../../features/home/data/repositories_impl/weather_repository_impl.dart'
    as _i37;
import '../../features/home/domain/repositories/location_repository.dart'
    as _i8;
import '../../features/home/domain/repositories/weather_repository.dart'
    as _i36;
import '../../features/home/domain/use_cases/location_use_case.dart' as _i10;
import '../../features/home/domain/use_cases/weather_use_case.dart' as _i38;
import '../../features/my_app/data/datasources/local/system_datasource.dart'
    as _i29;
import '../../features/my_app/data/datasources/local/system_datasource_impl.dart'
    as _i30;
import '../../features/my_app/data/repostioties_impl/system_repository_impl.dart'
    as _i32;
import '../../features/my_app/domain/repositories/system_repository.dart'
    as _i31;
import '../../features/my_app/domain/use_cases/system_use_case.dart' as _i33;
import '../../features/setting/data/datasources/remote/log_out_datasource.dart'
    as _i11;
import '../../features/setting/data/datasources/remote/log_out_datasource_impl.dart'
    as _i12;
import '../../features/setting/data/repositories_impl/log_out_repository_impl.dart'
    as _i14;
import '../../features/setting/domain/repositories/log_out_repository.dart'
    as _i13;
import '../../features/setting/domain/use_cases/log_out_use_cases.dart' as _i15;
import '../../theme/color_theme.dart' as _i4;
import '../data/datasource/local/share_preference_datasource.dart' as _i26;
import '../data/datasource/local/share_preference_datasource_impl.dart' as _i27;
import '../data/defines/constants/audio_constant.dart' as _i3;
import '../data/defines/constants/image_constant.dart' as _i5;
import 'di.dart' as _i39;

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
  gh.factory<_i3.AudioConstant>(() => _i3.AudioConstantImpl());
  gh.factory<_i4.ColorTheme>(() => _i4.ColorThemeImpl());
  gh.factory<_i5.ImageConstant>(() => _i5.ImageConstantImpl());
  gh.singleton<_i6.LocationDataSource>(_i7.LocationDataSouceImpl());
  gh.singleton<_i8.LocationRepository>(
      _i9.LocationRepositoryImpl(gh<_i6.LocationDataSource>()));
  gh.singleton<_i10.LocationUseCase>(
      _i10.LocationUseCaseImpl(gh<_i8.LocationRepository>()));
  gh.factory<_i11.LogOutDataSource>(() => _i12.LogOutDataSourceImpl());
  gh.factory<_i13.LogOutRepository>(
      () => _i14.LogOutRepositoryImpl(gh<_i11.LogOutDataSource>()));
  gh.factory<_i15.LogOutUseCase>(
      () => _i15.LogOutUseCaseImpl(gh<_i13.LogOutRepository>()));
  gh.factory<_i16.LoginWithGoogleDataSource>(
      () => _i17.LoginWithGoogleDataSourceImpl());
  gh.factory<_i18.LoginWithGoogleRepository>(() =>
      _i19.LoginWithGoogleRepositoryImpl(gh<_i16.LoginWithGoogleDataSource>()));
  gh.factory<_i20.LoginWithGoogleUseCase>(() =>
      _i20.LoginWithGoogleUseCaseImpl(gh<_i18.LoginWithGoogleRepository>()));
  gh.factory<_i21.PhoneDataSource>(() => _i22.PhoneDataSouceImpl());
  gh.factory<_i23.PhoneRepository>(
      () => _i24.PhoneRepositoryImpl(gh<_i21.PhoneDataSource>()));
  gh.factory<_i25.PhoneUseCase>(
      () => _i25.PhoneUsecaseimpl(gh<_i23.PhoneRepository>()));
  gh.factory<_i26.SharePreferenceDataSource>(
      () => _i27.SharePreferenceDataSouceImpl());
  await gh.factoryAsync<_i28.SharedPreferences>(
    () => appModule.sharedPreferences,
    preResolve: true,
  );
  gh.factory<_i29.SystemDataSource>(() => _i30.SystemDataSourceImpl());
  gh.factory<_i31.SystemRepository>(
      () => _i32.SystemRepositoryImpl(gh<_i29.SystemDataSource>()));
  gh.factory<_i33.SystemUsecase>(
      () => _i33.SystemUsecaseImpl(gh<_i31.SystemRepository>()));
  gh.factory<_i34.WeatherDataSource>(() => _i35.WeatherDataSourceImpl());
  gh.factory<_i36.WeatherRepository>(
      () => _i37.WeatherRepositoryImpl(gh<_i34.WeatherDataSource>()));
  gh.singleton<_i38.GetWeatherUseCase>(
      _i38.GetWeatherUseCaseImpl(gh<_i36.WeatherRepository>()));
  return getIt;
}

class _$AppModule extends _i39.AppModule {}
