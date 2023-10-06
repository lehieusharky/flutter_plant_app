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
import 'package:shared_preferences/shared_preferences.dart' as _i11;

import '../../features/auth/login/data/data_sources/remote/login_google_data_source.dart'
    as _i6;
import '../../features/auth/login/data/data_sources/remote/login_google_datasource_impl.dart'
    as _i5;
import '../../features/auth/login/data/repository_impl/login_google_repository_impl.dart'
    as _i8;
import '../../features/auth/login/domain/repositories/login_repository.dart'
    as _i7;
import '../../theme/color_theme.dart' as _i3;
import '../data/datasource/local/share_preference_datasource.dart' as _i9;
import '../data/datasource/local/share_preference_datasource_impl.dart' as _i10;
import '../data/defines/constants/image_constant.dart' as _i4;
import 'di.dart' as _i12;

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
      _i6.LoginWithGoogleDataSourceImpl());
  gh.factory<_i7.LoginWithGoogleRepository>(() =>
      _i8.LoginWithGoogleRepositoryImpl(gh<_i5.LoginWithGoogleDataSource>()));
  gh.factory<_i9.SharePreferenceDataSource>(
      () => _i10.SharePreferenceDataSouceImpl());
  await gh.factoryAsync<_i11.SharedPreferences>(
    () => appModule.sharedPreferences,
    preResolve: true,
  );
  return getIt;
}

class _$AppModule extends _i12.AppModule {}
