import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage/utils/app_colors.dart';
import 'package:islamic_marriage/utils/app_urls.dart';
import 'package:islamic_marriage/widgets/custom_appbar/custom_appbar.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(onPressedBack: (){Get.back();}, title: 'About Us',),
      body: Container(
        height: double.infinity.h,
        width: double.infinity.w,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppUrls.appLogoPng,
              height: 120.h,
              width: 120.w,
            ),
            Gap(40.h),
            Text(
              "Islamic Marriage is a premier Islamic matrimonial site in Bangladesh, known for connecting Muslim singles seeking compatible life partners. With its focus on Islamic values and comprehensive profiles, it has become a trusted platform for finding meaningful relationships.",
              style: Get.textTheme.bodyMedium!.copyWith(color: AppColors.greyColor),
              textAlign: TextAlign.center,
            ),
            Gap(24.h),
            Text('Technology Solution Provider', style: Get.textTheme.bodyMedium),
            Text('Softronixs System Limited', style: Get.textTheme.titleMedium),
            Gap(24.h),
            Image.asset(
              AppUrls.companyLogoPng,
              height: 60.h,
              width: 90.w,
            ),
          ],
        ),
      ),
    );
  }
}
