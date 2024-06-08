import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islamic_marriage/utils/app_colors.dart';
import 'package:islamic_marriage/utils/app_text_styles.dart';

class CustomExpansionTile extends StatelessWidget {
  final List<Widget> children;
  final String title;
  final bool leading;
  const CustomExpansionTile(
      {super.key,
      required this.title,
      required this.children,
      this.leading = true});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      collapsedIconColor: AppColors.violetClr,
      iconColor: AppColors.violetClr,
      shape: const RoundedRectangleBorder(
        side: BorderSide.none,
      ),
      leading: leading == true
          ? Container(
              height: 25.h,
              width: 25.w,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: AppColors.violetClr),
              child: Icon(
                Icons.add,
                color: AppColors.whiteClr,
                size: 20.sp,
              ),
            )
          : null,
      title: Text(
        title,
        style: AppTextStyles.bodyMedium()
      ),
      children: children,
    );
  }
}
