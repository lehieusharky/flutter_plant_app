import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:plant_market/src/core/data/datasource/local/share_preference_datasource.dart';
import 'package:plant_market/src/core/data/defines/constants/app_constant.dart';
import 'package:plant_market/src/core/data/defines/enum/supported_theme.dart';
import 'package:plant_market/src/features/my_app/presentation/bloc/my_app_bloc.dart';
import 'package:plant_market/src/l10n/app_localizations.dart';
import 'package:plant_market/src/router/app_router.dart';
import 'package:plant_market/src/theme/theme.dart';

ThemeMode themeMode = ThemeMode.light;

class MyMaterialApp extends StatefulWidget {
  const MyMaterialApp({super.key});

  @override
  State<MyMaterialApp> createState() => _MyMaterialAppState();
}

class _MyMaterialAppState extends State<MyMaterialApp> {
  String _languageCode = AppConstant.vi;

  @override
  void initState() {
    super.initState();
    themeMode = sharePreference.getTheme() == SupportedTheme.light
        ? ThemeMode.light
        : ThemeMode.dark;
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MyAppBloc(),
        ),
      ],
      child: BlocConsumer<MyAppBloc, MyAppState>(
        listener: (context, state) {
          if (state is MyAppGetSystemInfomationSuccess) {
            themeMode = state.systemModel.themeMode;
            _languageCode = state.systemModel.languageCode;
            sharePreference.setTheme(state.systemModel.themeMode.name);
            sharePreference.setLanguage(state.systemModel.languageCode);
          }
          if (state is MyAppToggleThemeSuccess) {
            themeMode = state.themeMode;
            sharePreference.setTheme(state.themeMode.name);
          }
          if (state is MyAppToggleLanguageSuccess) {
            _languageCode = state.languageCode;
            sharePreference.setLanguage(state.languageCode);
          }
        },
        builder: (context, state) {
          return _buildMaterialApp(context);
        },
      ),
    );
  }

  MaterialApp _buildMaterialApp(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: AppRouter.router.routerDelegate,
      routeInformationProvider: AppRouter.router.routeInformationProvider,
      routeInformationParser: AppRouter.router.routeInformationParser,
      debugShowCheckedModeBanner: false,
      themeMode: themeMode,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      // builder: DevicePreview.appBuilder,
      locale: Locale(_languageCode),
      darkTheme: darkTheme(context),
      supportedLocales: const [
        Locale('en'),
        Locale('vi'),
      ],
      theme: lightTheme(context),
      title: AppConstant.nameApp,
    );
  }
}
