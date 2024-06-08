import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islamic_marriage/utils/app_colors.dart';

class CustomBackButton extends StatelessWidget {

  final void Function()? onPressed;
  const CustomBackButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: CircleAvatar(
        radius: 18.r,
        backgroundColor: AppColors.violetClr,
        child: Icon(
        Icons.arrow_back,
        size: 18.sp,
        color: AppColors.whiteClr,
      ),
      ),
    );
  }
}
