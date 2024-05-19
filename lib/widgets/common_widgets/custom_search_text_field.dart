import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islamic_marriage/utils/app_colors.dart';
import 'package:islamic_marriage/utils/app_text_styles.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      width: double.infinity.w,
      child: TextField(
        style: AppTextStyles.bodyMedium(),
        cursorColor: AppColors.blackClr,
        decoration: InputDecoration(
          fillColor: AppColors.filledClr,
          filled: true,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 16.h,
          ),
          prefixIcon: Icon(
            Icons.search,
            color: AppColors.greyColor,
            size: 20.sp,
          ),
          hintText: 'Search',
          hintStyle: AppTextStyles.bodyMedium(color: AppColors.greyColor),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide.none),
        ),
      ),
    );
  }
}
