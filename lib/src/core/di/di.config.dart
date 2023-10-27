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
import 'package:shared_preferences/shared_preferences.dart' as _i53;

import '../../features/auth/login/data/data_sources/remote/login_google_datasource.dart'
    as _i31;
import '../../features/auth/login/data/data_sources/remote/login_google_datasource_impl.dart'
    as _i32;
import '../../features/auth/login/data/data_sources/remote/phone_datasource.dart'
    as _i36;
import '../../features/auth/login/data/data_sources/remote/phone_datasource_impl.dart'
    as _i37;
import '../../features/auth/login/data/repository_impl/login_google_repository_impl.dart'
    as _i34;
import '../../features/auth/login/data/repository_impl/phone_repository_impl.dart'
    as _i39;
import '../../features/auth/login/domain/repositories/login_repository.dart'
    as _i33;
import '../../features/auth/login/domain/repositories/phone_repository.dart'
    as _i38;
import '../../features/auth/login/domain/use_cases/login_google_usecase.dart'
    as _i35;
import '../../features/auth/login/domain/use_cases/phone_usecase.dart' as _i40;
import '../../features/home/data/datasources/community_datasource.dart' as _i5;
import '../../features/home/data/datasources/community_datasource_impl.dart'
    as _i6;
import '../../features/home/data/datasources/gallery_datasource.dart' as _i10;
import '../../features/home/data/datasources/gallery_datasource_impl.dart'
    as _i11;
import '../../features/home/data/datasources/location_datasouce_impl.dart'
    as _i22;
import '../../features/home/data/datasources/location_datasource.dart' as _i21;
import '../../features/home/data/datasources/weather_datasource.dart' as _i69;
import '../../features/home/data/datasources/weather_datasource_impl.dart'
    as _i70;
import '../../features/home/data/repositories_impl/community_repository_impl.dart'
    as _i8;
import '../../features/home/data/repositories_impl/gallery_repository_impl.dart'
    as _i13;
import '../../features/home/data/repositories_impl/location_repository_impl.dart'
    as _i24;
import '../../features/home/data/repositories_impl/weather_repository_impl.dart'
    as _i72;
import '../../features/home/domain/repositories/community_repository.dart'
    as _i7;
import '../../features/home/domain/repositories/gallery_repository.dart'
    as _i12;
import '../../features/home/domain/repositories/location_repository.dart'
    as _i23;
import '../../features/home/domain/repositories/weather_repository.dart'
    as _i71;
import '../../features/home/domain/use_cases/community_usecase.dart' as _i9;
import '../../features/home/domain/use_cases/gallery_usecase.dart' as _i14;
import '../../features/home/domain/use_cases/location_use_case.dart' as _i25;
import '../../features/home/domain/use_cases/weather_use_case.dart' as _i73;
import '../../features/my_app/data/datasources/local/system_datasource.dart'
    as _i54;
import '../../features/my_app/data/datasources/local/system_datasource_impl.dart'
    as _i55;
import '../../features/my_app/data/repostioties_impl/system_repository_impl.dart'
    as _i57;
import '../../features/my_app/domain/repositories/system_repository.dart'
    as _i56;
import '../../features/my_app/domain/use_cases/system_use_case.dart' as _i58;
import '../../features/popular_topic/data/datasources/plant_datasource.dart'
    as _i41;
import '../../features/popular_topic/data/datasources/plant_datasource_impl.dart'
    as _i42;
import '../../features/popular_topic/data/repositories_impl/plant_repository_impl.dart'
    as _i44;
import '../../features/popular_topic/domain/repositories/plant_repository.dart'
    as _i43;
import '../../features/popular_topic/domain/use_cases/plant_use_case.dart'
    as _i45;
import '../../features/setting/data/datasources/remote/log_out_datasource.dart'
    as _i26;
import '../../features/setting/data/datasources/remote/log_out_datasource_impl.dart'
    as _i27;
import '../../features/setting/data/repositories_impl/log_out_repository_impl.dart'
    as _i29;
import '../../features/setting/domain/repositories/log_out_repository.dart'
    as _i28;
import '../../features/setting/domain/use_cases/log_out_use_cases.dart' as _i30;
import '../../features/shake_animation/data/datasources/remote/music_datasource.dart'
    as _i46;
import '../../features/shake_animation/data/datasources/remote/music_datasource_impl.dart'
    as _i47;
import '../../features/shake_animation/data/repositories_impl/remote_music_repository_impl.dart'
    as _i49;
import '../../features/shake_animation/domain/repositories/remote_music_repository.dart'
    as _i48;
import '../../features/shake_animation/domain/use_cases/remote_music_use_case.dart'
    as _i50;
import '../../features/user/data/datasources/local/image_picker_datasource.dart'
    as _i16;
import '../../features/user/data/datasources/local/image_picker_datasource_impl.dart'
    as _i17;
import '../../features/user/data/datasources/remote/timeline_datasource.dart'
    as _i59;
import '../../features/user/data/datasources/remote/timeline_datasource_impl.dart'
    as _i60;
import '../../features/user/data/repositories_impl/image_picker_repository_impl.dart'
    as _i19;
import '../../features/user/data/repositories_impl/timeline_repository_impl.dart'
    as _i62;
import '../../features/user/domain/repositories/image_picker_repository.dart'
    as _i18;
import '../../features/user/domain/repositories/timeline_repository.dart'
    as _i61;
import '../../features/user/domain/use_cases/image_picker_use_case.dart'
    as _i20;
import '../../features/user/domain/use_cases/timeline_use_case.dart' as _i63;
import '../../theme/color_theme.dart' as _i4;
import '../data/datasource/local/share_preference_datasource.dart' as _i51;
import '../data/datasource/local/share_preference_datasource_impl.dart' as _i52;
import '../data/datasource/remote/user_datasource.dart' as _i64;
import '../data/datasource/remote/user_datasource_impl.dart' as _i65;
import '../data/defines/constants/audio_constant.dart' as _i3;
import '../data/defines/constants/image_constant.dart' as _i15;
import '../data/repositories_impl/user_repository_impl.dart' as _i67;
import '../domain/repositories/user_repository.dart' as _i66;
import '../domain/user_cases/user_use_cases.dart' as _i68;
import 'di.dart' as _i74;

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
  gh.factory<_i5.CommunityDataSource>(() => _i6.CommunityDataSourceImpl());
  gh.factory<_i7.CommunityRepository>(
      () => _i8.CommunityRepositoryImpl(gh<_i5.CommunityDataSource>()));
  gh.factory<_i9.CommunityUseCase>(
      () => _i9.CommunityUseCaseImpl(gh<_i7.CommunityRepository>()));
  gh.factory<_i10.GalleryDataSource>(() => _i11.GalleryDataSourceImpl());
  gh.factory<_i12.GalleryRepository>(
      () => _i13.GalleryDataSourceImpl(gh<_i10.GalleryDataSource>()));
  gh.factory<_i14.GalleryUseCase>(
      () => _i14.GalleryUseCaseImpl(gh<_i12.GalleryRepository>()));
  gh.factory<_i15.ImageConstant>(() => _i15.ImageConstantImpl());
  gh.factory<_i16.ImagePickerDataSource>(
      () => _i17.ImagePickerDataSourceImpl());
  gh.factory<_i18.ImagePickerRepository>(
      () => _i19.ImagePickerRepositoryImpl(gh<_i16.ImagePickerDataSource>()));
  gh.factory<_i20.ImagePickerUseCase>(
      () => _i20.ImagePickerUseCaseImpl(gh<_i18.ImagePickerRepository>()));
  gh.singleton<_i21.LocationDataSource>(_i22.LocationDataSouceImpl());
  gh.singleton<_i23.LocationRepository>(
      _i24.LocationRepositoryImpl(gh<_i21.LocationDataSource>()));
  gh.singleton<_i25.LocationUseCase>(
      _i25.LocationUseCaseImpl(gh<_i23.LocationRepository>()));
  gh.factory<_i26.LogOutDataSource>(() => _i27.LogOutDataSourceImpl());
  gh.factory<_i28.LogOutRepository>(
      () => _i29.LogOutRepositoryImpl(gh<_i26.LogOutDataSource>()));
  gh.factory<_i30.LogOutUseCase>(
      () => _i30.LogOutUseCaseImpl(gh<_i28.LogOutRepository>()));
  gh.factory<_i31.LoginWithGoogleDataSource>(
      () => _i32.LoginWithGoogleDataSourceImpl());
  gh.factory<_i33.LoginWithGoogleRepository>(() =>
      _i34.LoginWithGoogleRepositoryImpl(gh<_i31.LoginWithGoogleDataSource>()));
  gh.factory<_i35.LoginWithGoogleUseCase>(() =>
      _i35.LoginWithGoogleUseCaseImpl(gh<_i33.LoginWithGoogleRepository>()));
  gh.factory<_i36.PhoneDataSource>(() => _i37.PhoneDataSouceImpl());
  gh.factory<_i38.PhoneRepository>(
      () => _i39.PhoneRepositoryImpl(gh<_i36.PhoneDataSource>()));
  gh.factory<_i40.PhoneUseCase>(
      () => _i40.PhoneUsecaseimpl(gh<_i38.PhoneRepository>()));
  gh.factory<_i41.PlantDataSource>(() => _i42.PlantDataSourceImpl());
  gh.factory<_i43.PlantRepository>(
      () => _i44.PlantRepositoryImpl(gh<_i41.PlantDataSource>()));
  gh.factory<_i45.PlantUseCase>(
      () => _i45.PlantUseCaseImpl(gh<_i43.PlantRepository>()));
  gh.factory<_i46.RemoteMusicDataSource>(
      () => _i47.RemoteMusicDataSourceImpl());
  gh.factory<_i48.RemoteMusicRepository>(
      () => _i49.RemoteMusicRepositoryImpl(gh<_i46.RemoteMusicDataSource>()));
  gh.factory<_i50.RemoteMusicUseCase>(
      () => _i50.RemoteMusicUseCaseImpl(gh<_i48.RemoteMusicRepository>()));
  gh.factory<_i51.SharePreferenceDataSource>(
      () => _i52.SharePreferenceDataSouceImpl());
  await gh.factoryAsync<_i53.SharedPreferences>(
    () => appModule.sharedPreferences,
    preResolve: true,
  );
  gh.factory<_i54.SystemDataSource>(() => _i55.SystemDataSourceImpl());
  gh.factory<_i56.SystemRepository>(
      () => _i57.SystemRepositoryImpl(gh<_i54.SystemDataSource>()));
  gh.factory<_i58.SystemUsecase>(
      () => _i58.SystemUsecaseImpl(gh<_i56.SystemRepository>()));
  gh.factory<_i59.TimeLineDataSource>(() => _i60.TimeLineDataSourceImpl());
  gh.factory<_i61.TimeLineRepository>(
      () => _i62.TimeLineRepositoryImpl(gh<_i59.TimeLineDataSource>()));
  gh.factory<_i63.TimeLineUseCase>(
      () => _i63.TimeLineUseCaseImpl(gh<_i61.TimeLineRepository>()));
  gh.factory<_i64.UserDataSource>(() => _i65.UserDataSourceImpl());
  gh.factory<_i66.UserRepository>(
      () => _i67.UserRepositoryImpl(gh<_i64.UserDataSource>()));
  gh.factory<_i68.UserUseCase>(
      () => _i68.UserUseCaseImpl(gh<_i66.UserRepository>()));
  gh.factory<_i69.WeatherDataSource>(() => _i70.WeatherDataSourceImpl());
  gh.factory<_i71.WeatherRepository>(
      () => _i72.WeatherRepositoryImpl(gh<_i69.WeatherDataSource>()));
  gh.singleton<_i73.GetWeatherUseCase>(
      _i73.GetWeatherUseCaseImpl(gh<_i71.WeatherRepository>()));
  return getIt;
}

class _$AppModule extends _i74.AppModule {}
