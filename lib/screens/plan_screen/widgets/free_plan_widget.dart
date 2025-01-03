import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:islamic_marriage/screens/plan_screen/widgets/subscription_plan_card.dart';
import 'package:islamic_marriage/utils/app_colors.dart';
import 'package:islamic_marriage/utils/app_text_styles.dart';
import 'package:islamic_marriage/utils/app_urls.dart';

class FreePlanWidget extends StatelessWidget {
  const FreePlanWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Gap(16.h),
        Text('Free Plan', style: AppTextStyles.titleMedium()),
        Gap(16.h),
        Divider(color: AppColors.violetClr, thickness: 2.w,),
        Gap(16.h),
        SubscriptionPlanCard( iconUrl: AppUrls.doneSvg),
      ],
    );
  }
}
