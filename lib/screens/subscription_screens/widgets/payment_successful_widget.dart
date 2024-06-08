import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:islamic_marriage/utils/app_text_styles.dart';
import 'package:islamic_marriage/utils/app_urls.dart';

class PaymentSuccessfulWidget extends StatelessWidget {
  const PaymentSuccessfulWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(AppUrls.kingSvg, width: 280.w,),
        Gap(16.h),
        Text('Congratulations!', style: AppTextStyles.bodyLarge(fontSize: 40.sp),),
        Gap(16.h),
        Text('You have successfully subscribe 1 month premium plan. Now you can enjoy all the benefits!', style: AppTextStyles.bodyMedium(), textAlign: TextAlign.center,)
      ],
    );
  }
}
