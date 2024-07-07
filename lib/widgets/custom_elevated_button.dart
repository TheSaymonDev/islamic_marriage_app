import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:islamic_marriage/utils/app_colors.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonName;
  final double? buttonWidth;
  final double? buttonHeight;
  final IconData? icon;
  final TextStyle? style;

  const CustomElevatedButton({
    super.key,
    required this.onPressed,
    required this.buttonName,
    this.buttonWidth,
    this.buttonHeight,
    this.icon,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: buttonWidth ?? double.infinity.w,
      height: buttonHeight ?? 55.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        gradient: const LinearGradient(
          begin: Alignment(0.00, -1.00),
          end: Alignment(0, 1),
          colors: [Color(0xFF8C2065), Color(0xFF410F2F)],
        ),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
            padding: EdgeInsets.zero),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[
              Icon(icon, size: 20.sp, color: darkFontClr),
              Gap(4.w),
            ],
            Text(buttonName,
                style: style ?? Theme.of(context).textTheme.titleMedium!.copyWith(color: darkFontClr))
          ],
        ),
      ),
    );
  }
}
