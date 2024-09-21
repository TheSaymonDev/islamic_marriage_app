import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:islamic_marriage/screens/plan_screens/widgets/subscription_plan_card.dart';
import 'package:islamic_marriage/utils/app_colors.dart';
import 'package:islamic_marriage/utils/app_text_styles.dart';
import 'package:islamic_marriage/utils/app_urls.dart';
import 'package:islamic_marriage/widgets/custom_card.dart';

class SummaryWidget extends StatelessWidget {
  const SummaryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Gap(16.h),
        SvgPicture.asset(
          AppUrls.kingSvg,
          width: 75.w,
        ),
        Gap(8.h),
        RichText(
          text: TextSpan(
              text: '${AppUrls.takaSign}5/',
              style: AppTextStyles.titleLarge(),
              children: [
                TextSpan(text: 'Month', style: AppTextStyles.titleSmall())
              ]),
        ),
        Gap(8.h),
        Divider(
          height: 0.h,
          color: AppColors.violetClr,
          thickness: 2.w,
        ),
        Gap(8.h),
        Text(
          'Premium Plan',
          style: AppTextStyles.titleMedium()
        ),
        Gap(16.h),
        SubscriptionPlanCard( iconUrl: AppUrls.doneSvg),
        Gap(16.h),
        CustomCard(
          border: Border.all(color: AppColors.violetClr, width: 1.w),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 16.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Amount', style: AppTextStyles.titleSmall()),
                    Text('${AppUrls.takaSign}5.00', style: AppTextStyles.titleSmall())
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 16.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Tax', style: AppTextStyles.titleSmall()),
                    Text('${AppUrls.takaSign}1.00', style: AppTextStyles.titleSmall())
                  ],
                ),
              ),
              Divider(color: AppColors.greyColor, thickness: 1.w, height: 0.h,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 16.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total', style: AppTextStyles.titleSmall()),
                    Text('${AppUrls.takaSign}6.00', style: AppTextStyles.titleSmall())
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
