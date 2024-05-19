import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islamic_marriage/utils/app_colors.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    this.height,
    this.width,
    required this.child,
    this.padding,
    this.margin,
    this.isCardCircle = false,
    this.borderRadius,
    this.cardClr,
    this.border
  });

  final double? height;
  final double? width;
  final double? borderRadius;
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final bool isCardCircle;
  final Color? cardClr;
  final BoxBorder? border;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cardClr ?? AppColors.whiteClr,
      elevation: 4,
      margin: margin,
      shape: isCardCircle
          ?  const CircleBorder()
          : RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius ?? 8.r),
      ),
      child: Container(
        height: height,
        width: width ?? double.infinity.w,
        padding: padding,
        decoration: isCardCircle
            ? BoxDecoration(color: cardClr ?? AppColors.whiteClr, shape: BoxShape.circle)
            : BoxDecoration(
          color: cardClr ?? AppColors.whiteClr,
          borderRadius: BorderRadius.circular(borderRadius ?? 8.r),
          border: border
        ),
        child: child,
      ),
    );
  }
}