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
import 'package:shared_preferences/shared_preferences.dart' as _i33;

import '../../features/auth/login/data/data_sources/remote/login_google_datasource.dart'
    as _i22;
import '../../features/auth/login/data/data_sources/remote/login_google_datasource_impl.dart'
    as _i21;
import '../../features/auth/login/data/data_sources/remote/phone_datasource.dart'
    as _i26;
import '../../features/auth/login/data/data_sources/remote/phone_datasource_impl.dart'
    as _i27;
import '../../features/auth/login/data/repository_impl/login_google_repository_impl.dart'
    as _i24;
import '../../features/auth/login/data/repository_impl/phone_repository_impl.dart'
    as _i29;
import '../../features/auth/login/domain/repositories/login_repository.dart'
    as _i23;
import '../../features/auth/login/domain/repositories/phone_repository.dart'
    as _i28;
import '../../features/auth/login/domain/use_cases/login_google_usecase.dart'
    as _i25;
import '../../features/auth/login/domain/use_cases/phone_usecase.dart' as _i30;
import '../../features/home/data/datasources/location_datasouce_impl.dart'
    as _i12;
import '../../features/home/data/datasources/location_datasource.dart' as _i11;
import '../../features/home/data/datasources/weather_datasource.dart' as _i39;
import '../../features/home/data/datasources/weather_datasource_impl.dart'
    as _i40;
import '../../features/home/data/repositories_impl/location_repository_impl.dart'
    as _i14;
import '../../features/home/data/repositories_impl/weather_repository_impl.dart'
    as _i42;
import '../../features/home/domain/repositories/location_repository.dart'
    as _i13;
import '../../features/home/domain/repositories/weather_repository.dart'
    as _i41;
import '../../features/home/domain/use_cases/location_use_case.dart' as _i15;
import '../../features/home/domain/use_cases/weather_use_case.dart' as _i43;
import '../../features/my_app/data/datasources/local/system_datasource.dart'
    as _i34;
import '../../features/my_app/data/datasources/local/system_datasource_impl.dart'
    as _i35;
import '../../features/my_app/data/repostioties_impl/system_repository_impl.dart'
    as _i37;
import '../../features/my_app/domain/repositories/system_repository.dart'
    as _i36;
import '../../features/my_app/domain/use_cases/system_use_case.dart' as _i38;
import '../../features/setting/data/datasources/remote/log_out_datasource.dart'
    as _i16;
import '../../features/setting/data/datasources/remote/log_out_datasource_impl.dart'
    as _i17;
import '../../features/setting/data/repositories_impl/log_out_repository_impl.dart'
    as _i19;
import '../../features/setting/domain/repositories/log_out_repository.dart'
    as _i18;
import '../../features/setting/domain/use_cases/log_out_use_cases.dart' as _i20;
import '../../features/user/data/datasources/local/image_picker_datasource.dart'
    as _i6;
import '../../features/user/data/datasources/local/image_picker_datasource_impl.dart'
    as _i7;
import '../../features/user/data/repositories_impl/image_picker_repository_impl.dart'
    as _i9;
import '../../features/user/domain/repositories/image_picker_repository.dart'
    as _i8;
import '../../features/user/domain/use_cases/image_picker_use_case.dart'
    as _i10;
import '../../theme/color_theme.dart' as _i4;
import '../data/datasource/local/share_preference_datasource.dart' as _i31;
import '../data/datasource/local/share_preference_datasource_impl.dart' as _i32;
import '../data/defines/constants/audio_constant.dart' as _i3;
import '../data/defines/constants/image_constant.dart' as _i5;
import 'di.dart' as _i44;

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
  gh.factory<_i6.ImagePickerDataSource>(() => _i7.ImagePickerDataSourceImpl());
  gh.factory<_i8.ImagePickerRepository>(
      () => _i9.ImagePickerRepositoryImpl(gh<_i6.ImagePickerDataSource>()));
  gh.factory<_i10.ImagePickerUseCase>(
      () => _i10.ImagePickerUseCaseImpl(gh<_i8.ImagePickerRepository>()));
  gh.singleton<_i11.LocationDataSource>(_i12.LocationDataSouceImpl());
  gh.singleton<_i13.LocationRepository>(
      _i14.LocationRepositoryImpl(gh<_i11.LocationDataSource>()));
  gh.singleton<_i15.LocationUseCase>(
      _i15.LocationUseCaseImpl(gh<_i13.LocationRepository>()));
  gh.factory<_i16.LogOutDataSource>(() => _i17.LogOutDataSourceImpl());
  gh.factory<_i18.LogOutRepository>(
      () => _i19.LogOutRepositoryImpl(gh<_i16.LogOutDataSource>()));
  gh.factory<_i20.LogOutUseCase>(
      () => _i20.LogOutUseCaseImpl(gh<_i18.LogOutRepository>()));
  gh.factory<_i21.LoginWithGoogleDataSource>(
      () => _i22.LoginWithGoogleDataSourceImpl());
  gh.factory<_i23.LoginWithGoogleRepository>(() =>
      _i24.LoginWithGoogleRepositoryImpl(gh<_i21.LoginWithGoogleDataSource>()));
  gh.factory<_i25.LoginWithGoogleUseCase>(() =>
      _i25.LoginWithGoogleUseCaseImpl(gh<_i23.LoginWithGoogleRepository>()));
  gh.factory<_i26.PhoneDataSource>(() => _i27.PhoneDataSouceImpl());
  gh.factory<_i28.PhoneRepository>(
      () => _i29.PhoneRepositoryImpl(gh<_i26.PhoneDataSource>()));
  gh.factory<_i30.PhoneUseCase>(
      () => _i30.PhoneUsecaseimpl(gh<_i28.PhoneRepository>()));
  gh.factory<_i31.SharePreferenceDataSource>(
      () => _i32.SharePreferenceDataSouceImpl());
  await gh.factoryAsync<_i33.SharedPreferences>(
    () => appModule.sharedPreferences,
    preResolve: true,
  );
  gh.factory<_i34.SystemDataSource>(() => _i35.SystemDataSourceImpl());
  gh.factory<_i36.SystemRepository>(
      () => _i37.SystemRepositoryImpl(gh<_i34.SystemDataSource>()));
  gh.factory<_i38.SystemUsecase>(
      () => _i38.SystemUsecaseImpl(gh<_i36.SystemRepository>()));
  gh.factory<_i39.WeatherDataSource>(() => _i40.WeatherDataSourceImpl());
  gh.factory<_i41.WeatherRepository>(
      () => _i42.WeatherRepositoryImpl(gh<_i39.WeatherDataSource>()));
  gh.singleton<_i43.GetWeatherUseCase>(
      _i43.GetWeatherUseCaseImpl(gh<_i41.WeatherRepository>()));
  return getIt;
}

class _$AppModule extends _i44.AppModule {}
