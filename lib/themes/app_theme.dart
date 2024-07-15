import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islamic_marriage/utils/app_colors.dart';

final lightTheme = ThemeData(
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
);

final darkTheme = ThemeData(
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
);
