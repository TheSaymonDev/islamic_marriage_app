import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:islamic_marriage/screens/plan_screen/models/plan_model.dart';
import 'package:islamic_marriage/screens/plan_screen/widgets/subscription_plan_card.dart';
import 'package:islamic_marriage/utils/app_colors.dart';
import 'package:islamic_marriage/utils/app_text_styles.dart';
import 'package:islamic_marriage/utils/app_urls.dart';
import 'package:islamic_marriage/widgets/custom_card.dart';


class ChoosePlanWidget extends StatefulWidget {

  const ChoosePlanWidget({super.key});

  @override
  State<ChoosePlanWidget> createState() => _ChoosePlanWidgetState();
}

class _ChoosePlanWidgetState extends State<ChoosePlanWidget> {

  int _selectedPlan = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Gap(16.h),
        Text(
          'Premium Plan',
          style: AppTextStyles.titleMedium()
        ),
        Gap(16.h),
        Text(
          'Flexible plans and pricing allows you to easily learn and practice more and more.',
          style: AppTextStyles.bodySmall()
        ),
        Gap(16.h),
        Divider(
          color: AppColors.violetClr,
          thickness: 2.w
        ),
        Gap(16.h),
        SubscriptionPlanCard( iconUrl: AppUrls.doneSvg),
        Gap(16.h),
        Center(
            child: Text(
          'Choose your plan',
          style: AppTextStyles.titleMedium()
        )),
        Gap(16.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            PlanModel.plans.length,
            (index) => GestureDetector(
              onTap: () {
                setState(() {
                  _selectedPlan=index;
                });
              },
              child: CustomCard(
                height: 100.h,
                width: 185.w,
                border: _selectedPlan==index ? Border.all(color: AppColors.violetClr, width: 1.w) : null,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      PlanModel.plans[index].title,
                      style: AppTextStyles.titleMedium()
                    ),
                    Gap(8.h),
                    RichText(
                      text: TextSpan(
                          text: '${AppUrls.takaSign}${PlanModel.plans[index].price}/',
                          style: AppTextStyles.titleLarge(),
                          children: [TextSpan(text: PlanModel.plans[index].subTitle, style: AppTextStyles.titleSmall())]),
                    )
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
