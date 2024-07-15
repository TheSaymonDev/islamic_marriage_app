import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage/localizations/app_localization.dart';
import 'package:islamic_marriage/routes/app_pages.dart';
import 'package:islamic_marriage/themes/app_theme.dart';
import 'package:islamic_marriage/utils/app_initial_bindings.dart';

class MyApp extends StatelessWidget {
  final String? initialRoute;
  const MyApp({super.key, this.initialRoute});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: const Size(430, 932),
      builder: (_, child) {
        return GetMaterialApp(
            theme: lightTheme,
            darkTheme: darkTheme,
            debugShowCheckedModeBanner: false,
            translations: AppLocalization(),
            fallbackLocale: const Locale('en', 'US'),
            initialBinding: AppInitialBindings(),
            getPages: AppPages.pages,
            initialRoute: initialRoute);
      },
    );
  }
}