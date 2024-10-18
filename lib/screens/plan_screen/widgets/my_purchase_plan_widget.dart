import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:islamic_marriage/screens/plan_screen/widgets/subscription_plan_card.dart';
import 'package:islamic_marriage/utils/app_text_styles.dart';
import 'package:islamic_marriage/utils/app_urls.dart';
import 'package:islamic_marriage/widgets/custom_card.dart';

class MyPurchasePlanWidget extends StatelessWidget {
  const MyPurchasePlanWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Gap(16.h),
        Text('Premium Plan', style: AppTextStyles.titleMedium()),
        Gap(16.h),
        SubscriptionPlanCard( iconUrl: AppUrls.doneSvg),
        Gap(16.h),
        Row(
          children: [
            CustomCard(
              height: 100.h,
              width: 185.w,
              child: Center(
                child: Text(
                  'Start Date:\n09/2023',
                  style: AppTextStyles.titleMedium(),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const Spacer(),
            CustomCard(
              height: 100.h,
              width: 185.w,
              child: Center(
                child: Text(
                  'Expire Date:\n09/2024',
                  style: AppTextStyles.titleMedium(),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
