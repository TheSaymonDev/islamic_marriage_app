import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:islamic_marriage/utils/app_colors.dart';
import 'package:islamic_marriage/utils/app_text_styles.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

Future<dynamic> showDialogBox(
    {required String title,
    required String middleText,
    required void Function()? onPressedCancel,
    required void Function()? onPressedConfirm}) {
  return Get.defaultDialog(
    title: title,
    titleStyle: AppTextStyles.titleLarge(),
    middleText: middleText,
    middleTextStyle: AppTextStyles.bodyMedium(),
    backgroundColor: AppColors.whiteClr,
    barrierDismissible: false,
    radius: 15.r,
    actions: [
      TextButton(
          onPressed: onPressedCancel,
          child: Text('No', style: AppTextStyles.titleMedium())),
      TextButton(
          onPressed: onPressedConfirm,
          child: Text('Yes',
              style: AppTextStyles.titleMedium(color: AppColors.violetClr)))
    ],
  );
}

PinTheme pinTheme() {
  return PinTheme(
      shape: PinCodeFieldShape.box,
      borderRadius: BorderRadius.circular(4.r),
      borderWidth: 1.w,
      inactiveFillColor: AppColors.whiteClr,
      selectedFillColor: AppColors.whiteClr,
      fieldHeight: 46.h,
      fieldWidth: 46.w,
      activeColor: const Color(0xffDDDDDD),
      selectedColor: AppColors.violetClr,
      inactiveColor: const Color(0xffDDDDDD));
}

SnackbarController customErrorMessage({required dynamic message}) {
  return Get.snackbar('Error', message,
      icon: const Icon(Icons.error_outline, color: AppColors.blackClr),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      duration: const Duration(seconds: 2),
      colorText: AppColors.blackClr);
}

SnackbarController customSuccessMessage({required dynamic message}) {
  return Get.snackbar('Success', message,
      icon: const Icon(Icons.verified_outlined, color: AppColors.blackClr),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      duration: const Duration(seconds: 2),
      colorText: AppColors.blackClr);
}

SpinKitFadingCircle customCircularProgressIndicator =
    SpinKitFadingCircle(color: AppColors.violetClr, size: 50.0.r);

Future<dynamic> showAppDialogBox(
    {required String title,
    required String middleText,
    required void Function()? onPressedCancel,
    required void Function()? onPressedConfirm}) {
  return Get.defaultDialog(
    title: title,
    titleStyle: AppTextStyles.titleLarge(),
    middleText: middleText,
    middleTextStyle: AppTextStyles.bodyMedium(),
    backgroundColor: AppColors.whiteClr,
    barrierDismissible: false,
    radius: 16.r,
    actions: [
      TextButton(
          onPressed: onPressedCancel,
          child: Text('No', style: AppTextStyles.titleMedium())),
      TextButton(
          onPressed: onPressedConfirm,
          child: Text('Yes',
              style: AppTextStyles.titleMedium(color: AppColors.violetClr)))
    ],
  );
}

String formatDate(String dobString) {
  try {
    final date = DateTime.parse(dobString);
    final formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(date);
  } catch (error) {
    // Handle parsing error (optional)
    print("Error parsing date: $error");
    return dobString; // Or return a default value
  }
}
