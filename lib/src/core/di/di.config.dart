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
import 'package:shared_preferences/shared_preferences.dart' as _i27;

import '../../features/auth/login/data/data_sources/remote/login_google_datasource.dart'
    as _i16;
import '../../features/auth/login/data/data_sources/remote/login_google_datasource_impl.dart'
    as _i15;
import '../../features/auth/login/data/data_sources/remote/phone_datasource.dart'
    as _i20;
import '../../features/auth/login/data/data_sources/remote/phone_datasource_impl.dart'
    as _i21;
import '../../features/auth/login/data/repository_impl/login_google_repository_impl.dart'
    as _i18;
import '../../features/auth/login/data/repository_impl/phone_repository_impl.dart'
    as _i23;
import '../../features/auth/login/domain/repositories/login_repository.dart'
    as _i17;
import '../../features/auth/login/domain/repositories/phone_repository.dart'
    as _i22;
import '../../features/auth/login/domain/use_cases/login_google_usecase.dart'
    as _i19;
import '../../features/auth/login/domain/use_cases/phone_usecase.dart' as _i24;
import '../../features/home/data/datasources/location_datasouce_impl.dart'
    as _i6;
import '../../features/home/data/datasources/location_datasource.dart' as _i5;
import '../../features/home/data/datasources/weather_datasource.dart' as _i33;
import '../../features/home/data/datasources/weather_datasource_impl.dart'
    as _i34;
import '../../features/home/data/repositories_impl/location_repository_impl.dart'
    as _i8;
import '../../features/home/data/repositories_impl/weather_repository_impl.dart'
    as _i36;
import '../../features/home/domain/repositories/location_repository.dart'
    as _i7;
import '../../features/home/domain/repositories/weather_repository.dart'
    as _i35;
import '../../features/home/domain/use_cases/location_use_case.dart' as _i9;
import '../../features/home/domain/use_cases/weather_use_case.dart' as _i37;
import '../../features/my_app/data/datasources/local/system_datasource.dart'
    as _i28;
import '../../features/my_app/data/datasources/local/system_datasource_impl.dart'
    as _i29;
import '../../features/my_app/data/repostioties_impl/system_repository_impl.dart'
    as _i31;
import '../../features/my_app/domain/repositories/system_repository.dart'
    as _i30;
import '../../features/my_app/domain/use_cases/system_use_case.dart' as _i32;
import '../../features/setting/data/datasources/remote/log_out_datasource.dart'
    as _i10;
import '../../features/setting/data/datasources/remote/log_out_datasource_impl.dart'
    as _i11;
import '../../features/setting/data/repositories_impl/log_out_repository_impl.dart'
    as _i13;
import '../../features/setting/domain/repositories/log_out_repository.dart'
    as _i12;
import '../../features/setting/domain/use_cases/log_out_use_cases.dart' as _i14;
import '../../theme/color_theme.dart' as _i3;
import '../data/datasource/local/share_preference_datasource.dart' as _i25;
import '../data/datasource/local/share_preference_datasource_impl.dart' as _i26;
import '../data/defines/constants/image_constant.dart' as _i4;
import 'di.dart' as _i38;

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
  gh.factory<_i10.LogOutDataSource>(() => _i11.LogOutDataSourceImpl());
  gh.factory<_i12.LogOutRepository>(
      () => _i13.LogOutRepositoryImpl(gh<_i10.LogOutDataSource>()));
  gh.factory<_i14.LogOutUseCase>(
      () => _i14.LogOutUseCaseImpl(gh<_i12.LogOutRepository>()));
  gh.factory<_i15.LoginWithGoogleDataSource>(
      () => _i16.LoginWithGoogleDataSourceImpl());
  gh.factory<_i17.LoginWithGoogleRepository>(() =>
      _i18.LoginWithGoogleRepositoryImpl(gh<_i15.LoginWithGoogleDataSource>()));
  gh.factory<_i19.LoginWithGoogleUseCase>(() =>
      _i19.LoginWithGoogleUseCaseImpl(gh<_i17.LoginWithGoogleRepository>()));
  gh.factory<_i20.PhoneDataSource>(() => _i21.PhoneDataSouceImpl());
  gh.factory<_i22.PhoneRepository>(
      () => _i23.PhoneRepositoryImpl(gh<_i20.PhoneDataSource>()));
  gh.factory<_i24.PhoneUseCase>(
      () => _i24.PhoneUsecaseimpl(gh<_i22.PhoneRepository>()));
  gh.factory<_i25.SharePreferenceDataSource>(
      () => _i26.SharePreferenceDataSouceImpl());
  await gh.factoryAsync<_i27.SharedPreferences>(
    () => appModule.sharedPreferences,
    preResolve: true,
  );
  gh.factory<_i28.SystemDataSource>(() => _i29.SystemDataSourceImpl());
  gh.factory<_i30.SystemRepository>(
      () => _i31.SystemRepositoryImpl(gh<_i28.SystemDataSource>()));
  gh.factory<_i32.SystemUsecase>(
      () => _i32.SystemUsecaseImpl(gh<_i30.SystemRepository>()));
  gh.factory<_i33.WeatherDataSource>(() => _i34.WeatherDataSourceImpl());
  gh.factory<_i35.WeatherRepository>(
      () => _i36.WeatherRepositoryImpl(gh<_i33.WeatherDataSource>()));
  gh.singleton<_i37.GetWeatherUseCase>(
      _i37.GetWeatherUseCaseImpl(gh<_i35.WeatherRepository>()));
  return getIt;
}

class _$AppModule extends _i38.AppModule {}
