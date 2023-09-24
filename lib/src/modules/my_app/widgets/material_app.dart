import 'package:flutter/material.dart';
import 'package:plant_market/src/core/constants.dart';
import 'package:plant_market/src/router/app_router.dart';

class MyMaterialApp extends MaterialApp {
  const MyMaterialApp({super.key});

  MaterialApp build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: AppRouter.router.routerDelegate,
      routeInformationProvider: AppRouter.router.routeInformationProvider,
      routeInformationParser: AppRouter.router.routeInformationParser,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      title: AppConstant.nameApp,
    );
  }
}
