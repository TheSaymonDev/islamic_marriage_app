import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage/utils/app_colors.dart';

class CustomTextLogo extends StatelessWidget {
  const CustomTextLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
          text: 'islamic'.tr,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: violetClr, fontSize: 35.sp),
          children: [
            TextSpan(
                text: 'marriage'.tr,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: purpleClr, fontSize: 35.sp))
          ]),
    );
  }
}
