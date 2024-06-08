import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage/screens/sign_in_screen/sign_in_screen.dart';
import 'package:islamic_marriage/utils/app_colors.dart';
import 'package:islamic_marriage/utils/app_text_styles.dart';
import 'package:islamic_marriage/utils/app_urls.dart';
import 'package:islamic_marriage/widgets/custom_elevated_button.dart';


class AuthSuccessfulScreen extends StatelessWidget {
  const AuthSuccessfulScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity.h,
        width: double.infinity.w,
        padding: EdgeInsets.symmetric(horizontal: 32.w),
        child: Column(
          children: [
            const Spacer(),
            SvgPicture.asset(AppUrls.celebrationSvg, height: 312.h, width: 192.w,),
            const Spacer(),
            Text('Password Changed!', style: AppTextStyles.titleLarge(color: AppColors.violetClr, fontSize: 30.sp)),
            Gap(32.h),
            Text('Your Password has been changed successfully', style: AppTextStyles.bodyMedium()),
            const Spacer(),
            CustomElevatedButton(onPressed: (){
              Get.to(()=>const SignInScreen());
            }, buttonName: 'Continue'),
            Gap(32.h),
          ],
        ),
      ),
    );
  }
}
