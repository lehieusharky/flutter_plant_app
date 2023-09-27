import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:plant_market/src/core/constants.dart';
import 'package:plant_market/src/l10n/app_localizations.dart';
import 'package:plant_market/src/router/app_router.dart';

class MyMaterialApp extends MaterialApp {
  const MyMaterialApp({super.key});

  MaterialApp build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: AppRouter.router.routerDelegate,
      routeInformationProvider: AppRouter.router.routeInformationProvider,
      routeInformationParser: AppRouter.router.routeInformationParser,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: const Locale('en'),
      supportedLocales: const [
        Locale('en'),
        Locale('vi'),
      ],
      theme: ThemeData.light(),
      title: AppConstant.nameApp,
    );
  }
}
