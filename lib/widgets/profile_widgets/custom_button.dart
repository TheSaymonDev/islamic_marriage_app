import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:islamic_marriage/utils/app_colors.dart';
import 'package:islamic_marriage/utils/app_text_styles.dart';
import 'package:islamic_marriage/widgets/common_widgets/custom_card.dart';

class CustomButton extends StatelessWidget {

  final void Function()? onTap;
  final IconData iconData;
  final String title;
  const CustomButton({super.key, required this.onTap, required this.iconData, required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CustomCard(
        height: 56.h,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        border: Border.all(color: AppColors.violetClr, width: 1.w),
        cardClr: const Color(0xFFE6E6E6),
        child: Row(
          children: [
            Icon(
              iconData,
              size: 22.sp,
              color: AppColors.blackClr
            ),
            Gap(16.w),
            Text(
              title,
              style: AppTextStyles.bodyMedium()
            ),
            const Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              size: 20.sp,
              color: AppColors.blackClr
            )
          ],
        ),
      ),
    );
  }
}
