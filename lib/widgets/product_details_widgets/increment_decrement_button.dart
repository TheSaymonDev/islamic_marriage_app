import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islamic_marriage/utils/app_colors.dart';

class IncrementDecrementButton extends StatelessWidget {

  final IconData iconData;
  final void Function()? onTap;
  const IncrementDecrementButton({super.key, required this.iconData, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onTap,
      child: Container(
        height: 35.h,
        width: 37.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: AppColors.whiteClr
        ),
        child: Icon(iconData, color: AppColors.blackClr, size: 15.sp),
      ),
    );
  }
}
