import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage/utils/app_colors.dart';
import 'package:islamic_marriage/utils/app_text_styles.dart';

class ConstantFunctions {
  static Future<dynamic> showDialogBox({
    required String title,
    required String middleText,
    required void Function()? onPressedCancel,
    required void Function()? onPressedConfirm,
  }) {
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
        ]);
  }
}
