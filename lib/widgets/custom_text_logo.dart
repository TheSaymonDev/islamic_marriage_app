import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islamic_marriage/utils/app_colors.dart';
import 'package:islamic_marriage/utils/app_text_styles.dart';

class CustomTextLogo extends StatelessWidget {
  const CustomTextLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
          text: 'Islamic ',
          style: AppTextStyles.titleLarge(color: AppColors.violetClr, fontSize: 35.sp),
          children: [
            TextSpan(
              text: 'Marriage',
              style: AppTextStyles.titleLarge(color: AppColors.purpleClr, fontSize: 35.sp),
            )
          ]),
    );
  }
}
