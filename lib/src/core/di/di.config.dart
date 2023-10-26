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
import 'package:shared_preferences/shared_preferences.dart' as _i43;

import '../../features/auth/login/data/data_sources/remote/login_google_datasource.dart'
    as _i21;
import '../../features/auth/login/data/data_sources/remote/login_google_datasource_impl.dart'
    as _i22;
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
import '../../features/home/data/datasources/weather_datasource.dart' as _i59;
import '../../features/home/data/datasources/weather_datasource_impl.dart'
    as _i60;
import '../../features/home/data/repositories_impl/location_repository_impl.dart'
    as _i14;
import '../../features/home/data/repositories_impl/weather_repository_impl.dart'
    as _i62;
import '../../features/home/domain/repositories/location_repository.dart'
    as _i13;
import '../../features/home/domain/repositories/weather_repository.dart'
    as _i61;
import '../../features/home/domain/use_cases/location_use_case.dart' as _i15;
import '../../features/home/domain/use_cases/weather_use_case.dart' as _i63;
import '../../features/my_app/data/datasources/local/system_datasource.dart'
    as _i44;
import '../../features/my_app/data/datasources/local/system_datasource_impl.dart'
    as _i45;
import '../../features/my_app/data/repostioties_impl/system_repository_impl.dart'
    as _i47;
import '../../features/my_app/domain/repositories/system_repository.dart'
    as _i46;
import '../../features/my_app/domain/use_cases/system_use_case.dart' as _i48;
import '../../features/popular_topic/data/datasources/plant_datasource.dart'
    as _i31;
import '../../features/popular_topic/data/datasources/plant_datasource_impl.dart'
    as _i32;
import '../../features/popular_topic/data/repositories_impl/plant_repository_impl.dart'
    as _i34;
import '../../features/popular_topic/domain/repositories/plant_repository.dart'
    as _i33;
import '../../features/popular_topic/domain/use_cases/plant_use_case.dart'
    as _i35;
import '../../features/setting/data/datasources/remote/log_out_datasource.dart'
    as _i16;
import '../../features/setting/data/datasources/remote/log_out_datasource_impl.dart'
    as _i17;
import '../../features/setting/data/repositories_impl/log_out_repository_impl.dart'
    as _i19;
import '../../features/setting/domain/repositories/log_out_repository.dart'
    as _i18;
import '../../features/setting/domain/use_cases/log_out_use_cases.dart' as _i20;
import '../../features/shake_animation/data/datasources/remote/music_datasource.dart'
    as _i36;
import '../../features/shake_animation/data/datasources/remote/music_datasource_impl.dart'
    as _i37;
import '../../features/shake_animation/data/repositories_impl/remote_music_repository_impl.dart'
    as _i39;
import '../../features/shake_animation/domain/repositories/remote_music_repository.dart'
    as _i38;
import '../../features/shake_animation/domain/use_cases/remote_music_use_case.dart'
    as _i40;
import '../../features/user/data/datasources/local/image_picker_datasource.dart'
    as _i6;
import '../../features/user/data/datasources/local/image_picker_datasource_impl.dart'
    as _i7;
import '../../features/user/data/datasources/remote/timeline_datasource.dart'
    as _i49;
import '../../features/user/data/datasources/remote/timeline_datasource_impl.dart'
    as _i50;
import '../../features/user/data/repositories_impl/image_picker_repository_impl.dart'
    as _i9;
import '../../features/user/data/repositories_impl/timeline_repository_impl.dart'
    as _i52;
import '../../features/user/domain/repositories/image_picker_repository.dart'
    as _i8;
import '../../features/user/domain/repositories/timeline_repository.dart'
    as _i51;
import '../../features/user/domain/use_cases/image_picker_use_case.dart'
    as _i10;
import '../../features/user/domain/use_cases/timeline_use_case.dart' as _i53;
import '../../theme/color_theme.dart' as _i4;
import '../data/datasource/local/share_preference_datasource.dart' as _i41;
import '../data/datasource/local/share_preference_datasource_impl.dart' as _i42;
import '../data/datasource/remote/user_datasource.dart' as _i54;
import '../data/datasource/remote/user_datasource_impl.dart' as _i55;
import '../data/defines/constants/audio_constant.dart' as _i3;
import '../data/defines/constants/image_constant.dart' as _i5;
import '../data/repositories_impl/user_repository_impl.dart' as _i57;
import '../domain/repositories/user_repository.dart' as _i56;
import '../domain/user_cases/user_use_cases.dart' as _i58;
import 'di.dart' as _i64;

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
  gh.factory<_i31.PlantDataSource>(() => _i32.PlantDataSourceImpl());
  gh.factory<_i33.PlantRepository>(
      () => _i34.PlantRepositoryImpl(gh<_i31.PlantDataSource>()));
  gh.factory<_i35.PlantUseCase>(
      () => _i35.PlantUseCaseImpl(gh<_i33.PlantRepository>()));
  gh.factory<_i36.RemoteMusicDataSource>(
      () => _i37.RemoteMusicDataSourceImpl());
  gh.factory<_i38.RemoteMusicRepository>(
      () => _i39.RemoteMusicRepositoryImpl(gh<_i36.RemoteMusicDataSource>()));
  gh.factory<_i40.RemoteMusicUseCase>(
      () => _i40.RemoteMusicUseCaseImpl(gh<_i38.RemoteMusicRepository>()));
  gh.factory<_i41.SharePreferenceDataSource>(
      () => _i42.SharePreferenceDataSouceImpl());
  await gh.factoryAsync<_i43.SharedPreferences>(
    () => appModule.sharedPreferences,
    preResolve: true,
  );
  gh.factory<_i44.SystemDataSource>(() => _i45.SystemDataSourceImpl());
  gh.factory<_i46.SystemRepository>(
      () => _i47.SystemRepositoryImpl(gh<_i44.SystemDataSource>()));
  gh.factory<_i48.SystemUsecase>(
      () => _i48.SystemUsecaseImpl(gh<_i46.SystemRepository>()));
  gh.factory<_i49.TimeLineDataSource>(() => _i50.TimeLineDataSourceImpl());
  gh.factory<_i51.TimeLineRepository>(
      () => _i52.TimeLineRepositoryImpl(gh<_i49.TimeLineDataSource>()));
  gh.factory<_i53.TimeLineUseCase>(
      () => _i53.TimeLineUseCaseImpl(gh<_i51.TimeLineRepository>()));
  gh.factory<_i54.UserDataSource>(() => _i55.UserDataSourceImpl());
  gh.factory<_i56.UserRepository>(
      () => _i57.UserRepositoryImpl(gh<_i54.UserDataSource>()));
  gh.factory<_i58.UserUseCase>(
      () => _i58.UserUseCaseImpl(gh<_i56.UserRepository>()));
  gh.factory<_i59.WeatherDataSource>(() => _i60.WeatherDataSourceImpl());
  gh.factory<_i61.WeatherRepository>(
      () => _i62.WeatherRepositoryImpl(gh<_i59.WeatherDataSource>()));
  gh.singleton<_i63.GetWeatherUseCase>(
      _i63.GetWeatherUseCaseImpl(gh<_i61.WeatherRepository>()));
  return getIt;
}

class _$AppModule extends _i64.AppModule {}
