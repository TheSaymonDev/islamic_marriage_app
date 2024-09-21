import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage/localizations/app_localization.dart';
import 'package:islamic_marriage/routes/app_pages.dart';
import 'package:islamic_marriage/utils/app_colors.dart';
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
            theme: ThemeData(
              brightness: Brightness.light,
              scaffoldBackgroundColor: lightBgClr,
              useMaterial3: true,
              fontFamily: 'Gumela Arabic',
              colorScheme: const ColorScheme(
                  brightness: Brightness.light,
                  primary: violetClr,
                  onPrimary: lightFontClr,
                  secondary: lightCardClr,
                  onSecondary: lightFontClr,
                  error: Colors.red,
                  onError: lightBgClr,
                  surface: lightCardClr,
                  onSurface: lightFontClr),
              textTheme: TextTheme(
                bodyLarge:
                TextStyle(fontSize: 25.sp, fontWeight: FontWeight.normal, height: 1),
                bodyMedium:
                TextStyle(fontSize: 20.sp, fontWeight: FontWeight.normal, height: 1),
                bodySmall:
                TextStyle(fontSize: 15.sp, fontWeight: FontWeight.normal, height: 1),
                titleLarge:
                TextStyle(fontSize: 25.sp, fontWeight: FontWeight.bold, height: 1),
                titleMedium:
                TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold, height: 1),
                titleSmall:
                TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold, height: 1),
              ),
              inputDecorationTheme: InputDecorationTheme(
                filled: true,
                fillColor: filledClr,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: BorderSide(color: violetClr, width: 2.w),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: BorderSide(color: violetClr, width: 2.w),
                ),
              ),
              appBarTheme: const AppBarTheme(backgroundColor: lightBgClr),
            ),
            darkTheme: ThemeData(
              brightness: Brightness.dark,
              scaffoldBackgroundColor: darkBgClr,
              fontFamily: 'Gumela Arabic',
              useMaterial3: true,
              colorScheme: const ColorScheme(
                  brightness: Brightness.dark,
                  primary: violetClr,
                  onPrimary: darkFontClr,
                  secondary: darkCardClr,
                  onSecondary: darkFontClr,
                  error: Colors.red,
                  onError: lightBgClr,
                  surface: darkCardClr,
                  onSurface: darkFontClr),
              textTheme: TextTheme(
                bodyLarge:
                TextStyle(fontSize: 25.sp, fontWeight: FontWeight.normal, height: 1),
                bodyMedium:
                TextStyle(fontSize: 20.sp, fontWeight: FontWeight.normal, height: 1),
                bodySmall:
                TextStyle(fontSize: 15.sp, fontWeight: FontWeight.normal, height: 1),
                titleLarge:
                TextStyle(fontSize: 25.sp, fontWeight: FontWeight.bold, height: 1),
                titleMedium:
                TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold, height: 1),
                titleSmall:
                TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold, height: 1),
              ),
              inputDecorationTheme: InputDecorationTheme(
                filled: true,
                fillColor: filledClr,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: BorderSide(color: violetClr, width: 2.w),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                  borderSide: BorderSide(color: violetClr, width: 2.w),
                ),
              ),
              appBarTheme: const AppBarTheme(backgroundColor: lightBgClr),
            ),
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