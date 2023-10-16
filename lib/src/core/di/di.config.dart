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
import 'package:shared_preferences/shared_preferences.dart' as _i38;

import '../../features/auth/login/data/data_sources/remote/auth_database_datasource.dart'
    as _i4;
import '../../features/auth/login/data/data_sources/remote/auth_database_datasource_impl.dart'
    as _i5;
import '../../features/auth/login/data/data_sources/remote/login_google_datasource_impl.dart'
    as _i27;
import '../../features/auth/login/data/data_sources/remote/login_google_datasource.dart'
    as _i26;
import '../../features/auth/login/data/data_sources/remote/phone_datasource.dart'
    as _i31;
import '../../features/auth/login/data/data_sources/remote/phone_datasource_impl.dart'
    as _i32;
import '../../features/auth/login/data/repository_impl/auth_database_repository_impl.dart'
    as _i7;
import '../../features/auth/login/data/repository_impl/login_google_repository_impl.dart'
    as _i29;
import '../../features/auth/login/data/repository_impl/phone_repository_impl.dart'
    as _i34;
import '../../features/auth/login/domain/repositories/auth_database_repository.dart'
    as _i6;
import '../../features/auth/login/domain/repositories/login_repository.dart'
    as _i28;
import '../../features/auth/login/domain/repositories/phone_repository.dart'
    as _i33;
import '../../features/auth/login/domain/use_cases/auth_database_usecase.dart'
    as _i8;
import '../../features/auth/login/domain/use_cases/login_google_usecase.dart'
    as _i30;
import '../../features/auth/login/domain/use_cases/phone_usecase.dart' as _i35;
import '../../features/home/data/datasources/location_datasouce_impl.dart'
    as _i17;
import '../../features/home/data/datasources/location_datasource.dart' as _i16;
import '../../features/home/data/datasources/weather_datasource.dart' as _i44;
import '../../features/home/data/datasources/weather_datasource_impl.dart'
    as _i45;
import '../../features/home/data/repositories_impl/location_repository_impl.dart'
    as _i19;
import '../../features/home/data/repositories_impl/weather_repository_impl.dart'
    as _i47;
import '../../features/home/domain/repositories/location_repository.dart'
    as _i18;
import '../../features/home/domain/repositories/weather_repository.dart'
    as _i46;
import '../../features/home/domain/use_cases/location_use_case.dart' as _i20;
import '../../features/home/domain/use_cases/weather_use_case.dart' as _i48;
import '../../features/my_app/data/datasources/local/system_datasource.dart'
    as _i39;
import '../../features/my_app/data/datasources/local/system_datasource_impl.dart'
    as _i40;
import '../../features/my_app/data/repostioties_impl/system_repository_impl.dart'
    as _i42;
import '../../features/my_app/domain/repositories/system_repository.dart'
    as _i41;
import '../../features/my_app/domain/use_cases/system_use_case.dart' as _i43;
import '../../features/setting/data/datasources/remote/log_out_datasource.dart'
    as _i21;
import '../../features/setting/data/datasources/remote/log_out_datasource_impl.dart'
    as _i22;
import '../../features/setting/data/repositories_impl/log_out_repository_impl.dart'
    as _i24;
import '../../features/setting/domain/repositories/log_out_repository.dart'
    as _i23;
import '../../features/setting/domain/use_cases/log_out_use_cases.dart' as _i25;
import '../../features/user/data/datasources/local/image_picker_datasource.dart'
    as _i11;
import '../../features/user/data/datasources/local/image_picker_datasource_impl.dart'
    as _i12;
import '../../features/user/data/repositories_impl/image_picker_repository_impl.dart'
    as _i14;
import '../../features/user/domain/repositories/image_picker_repository.dart'
    as _i13;
import '../../features/user/domain/use_cases/image_picker_use_case.dart'
    as _i15;
import '../../theme/color_theme.dart' as _i9;
import '../data/datasource/local/share_preference_datasource.dart' as _i36;
import '../data/datasource/local/share_preference_datasource_impl.dart' as _i37;
import '../data/defines/constants/audio_constant.dart' as _i3;
import '../data/defines/constants/image_constant.dart' as _i10;
import 'di.dart' as _i49;

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
  gh.factory<_i4.AuthenticationDataBaseDataSource>(
      () => _i5.AuthenticationDataBaseDataSourceImpl());
  gh.factory<_i6.AuthenticationDataBaseRepository>(() =>
      _i7.AuthenticationDataBaseRepositoryImpl(
          gh<_i4.AuthenticationDataBaseDataSource>()));
  gh.factory<_i8.AuthenticationDataBaseUseCase>(() =>
      _i8.AuthenticationDataBaseUseCaseImpl(
          gh<_i6.AuthenticationDataBaseRepository>()));
  gh.factory<_i9.ColorTheme>(() => _i9.ColorThemeImpl());
  gh.factory<_i10.ImageConstant>(() => _i10.ImageConstantImpl());
  gh.factory<_i11.ImagePickerDataSource>(
      () => _i12.ImagePickerDataSourceImpl());
  gh.factory<_i13.ImagePickerRepository>(
      () => _i14.ImagePickerRepositoryImpl(gh<_i11.ImagePickerDataSource>()));
  gh.factory<_i15.ImagePickerUseCase>(
      () => _i15.ImagePickerUseCaseImpl(gh<_i13.ImagePickerRepository>()));
  gh.singleton<_i16.LocationDataSource>(_i17.LocationDataSouceImpl());
  gh.singleton<_i18.LocationRepository>(
      _i19.LocationRepositoryImpl(gh<_i16.LocationDataSource>()));
  gh.singleton<_i20.LocationUseCase>(
      _i20.LocationUseCaseImpl(gh<_i18.LocationRepository>()));
  gh.factory<_i21.LogOutDataSource>(() => _i22.LogOutDataSourceImpl());
  gh.factory<_i23.LogOutRepository>(
      () => _i24.LogOutRepositoryImpl(gh<_i21.LogOutDataSource>()));
  gh.factory<_i25.LogOutUseCase>(
      () => _i25.LogOutUseCaseImpl(gh<_i23.LogOutRepository>()));
  gh.factory<_i26.LoginWithGoogleDataSource>(
      () => _i27.LoginWithGoogleDataSourceImpl());
  gh.factory<_i28.LoginWithGoogleRepository>(() =>
      _i29.LoginWithGoogleRepositoryImpl(gh<_i26.LoginWithGoogleDataSource>()));
  gh.factory<_i30.LoginWithGoogleUseCase>(() =>
      _i30.LoginWithGoogleUseCaseImpl(gh<_i28.LoginWithGoogleRepository>()));
  gh.factory<_i31.PhoneDataSource>(() => _i32.PhoneDataSouceImpl());
  gh.factory<_i33.PhoneRepository>(
      () => _i34.PhoneRepositoryImpl(gh<_i31.PhoneDataSource>()));
  gh.factory<_i35.PhoneUseCase>(
      () => _i35.PhoneUsecaseimpl(gh<_i33.PhoneRepository>()));
  gh.factory<_i36.SharePreferenceDataSource>(
      () => _i37.SharePreferenceDataSouceImpl());
  await gh.factoryAsync<_i38.SharedPreferences>(
    () => appModule.sharedPreferences,
    preResolve: true,
  );
  gh.factory<_i39.SystemDataSource>(() => _i40.SystemDataSourceImpl());
  gh.factory<_i41.SystemRepository>(
      () => _i42.SystemRepositoryImpl(gh<_i39.SystemDataSource>()));
  gh.factory<_i43.SystemUsecase>(
      () => _i43.SystemUsecaseImpl(gh<_i41.SystemRepository>()));
  gh.factory<_i44.WeatherDataSource>(() => _i45.WeatherDataSourceImpl());
  gh.factory<_i46.WeatherRepository>(
      () => _i47.WeatherRepositoryImpl(gh<_i44.WeatherDataSource>()));
  gh.singleton<_i48.GetWeatherUseCase>(
      _i48.GetWeatherUseCaseImpl(gh<_i46.WeatherRepository>()));
  return getIt;
}

class _$AppModule extends _i49.AppModule {}
