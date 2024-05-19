import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islamic_marriage/utils/app_colors.dart';

class AppTextStyles {
  static TextStyle bodyLarge({Color? color, double? fontSize}) {
    return TextStyle(
        fontSize: fontSize ?? 25.sp,
        color: color ?? AppColors.blackClr,
        fontWeight: FontWeight.normal,
        height: 1,
        fontFamily: 'Gumela Arabic');
  }

  static TextStyle bodyMedium({Color? color}) {
    return TextStyle(
        fontSize: 20.sp,
        color: color ?? AppColors.blackClr,
        fontWeight: FontWeight.normal,
        height: 1,
        fontFamily: 'Gumela Arabic');
  }

  static TextStyle bodySmall({Color? color}) {
    return TextStyle(
        fontSize: 15.sp,
        color: color ?? AppColors.blackClr,
        fontWeight: FontWeight.normal,
        height: 1,
        fontFamily: 'Gumela Arabic');
  }

  static TextStyle titleLarge({Color? color, double? fontSize}) {
    return TextStyle(
        fontSize: fontSize ?? 25.sp,
        color: color ?? AppColors.blackClr,
        fontWeight: FontWeight.bold,
        height: 1,
        fontFamily: 'Gumela Arabic');
  }

  static TextStyle titleMedium({Color? color, TextDecoration? textDecoration}) {
    return TextStyle(
        fontSize: 20.sp,
        color: color ?? AppColors.blackClr,
        fontWeight: FontWeight.bold,
        height: 1,
        decoration: textDecoration,
        fontFamily: 'Gumela Arabic');
  }

  static TextStyle titleSmall({Color? color}) {
    return TextStyle(
        fontSize: 15.sp,
        color: color ?? AppColors.blackClr,
        fontWeight: FontWeight.bold,
        height: 1,
        fontFamily: 'Gumela Arabic');
  }
}
