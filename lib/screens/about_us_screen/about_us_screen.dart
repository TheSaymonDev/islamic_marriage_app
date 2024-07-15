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
      appBar: CustomAppbar(
          onPressedBack: () {
            Get.back();
          },
          title: 'aboutUs'.tr),
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
            Text("aboutUsDes".tr,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: greyClr),
                textAlign: TextAlign.center),
            Gap(24.h),
            Text('technologySolutionProvider'.tr,
                style: Theme.of(context).textTheme.bodyMedium),
            Gap(4.h),
            Text('companyName'.tr,
                style: Theme.of(context).textTheme.titleMedium),
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
