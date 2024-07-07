import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islamic_marriage/utils/app_colors.dart';

class CustomProfileAvatar extends StatelessWidget {
  final void Function()? onTap;
  final ImageProvider<Object>? foregroundImage;
  final IconData iconData;

  const CustomProfileAvatar(
      {Key? key,
      this.onTap,
      required this.foregroundImage,
      required this.iconData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          SizedBox(
            height: 110.h,
            width: 110.w,
            child: CircleAvatar(
              foregroundImage: foregroundImage,
            ),
          ),
          Positioned(
            top: 5,
            right: 5,
            child: CircleAvatar(
              backgroundColor: violetClr,
              radius: 15.r,
              child: Icon(iconData, color: lightBgClr, size: 15.sp),
            ),
          )
        ],
      ),
    );
  }
}
