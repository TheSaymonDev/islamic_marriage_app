import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islamic_marriage/utils/app_colors.dart';
import 'package:islamic_marriage/widgets/custom_card.dart';

class SubscriptionPlanCard extends StatelessWidget {
  final String iconUrl;
  SubscriptionPlanCard({super.key, required this.iconUrl});

  final List<String> planList = [
    'Unlimited Plum Tree',
    '24/7 Support',
    'High Time Learning',
    'Best Learning Experience',
    'Mistakes Review',
    'Ad Free Service',
  ];

  @override
  Widget build(BuildContext context) {
    final myTextStyle = Theme.of(context).textTheme;
    return CustomCard(
      border: Border.all(color: AppColors.violetClr, width: 1.w),
      child: Column(
        children: List.generate(
            planList.length,
            (index) => SizedBox(
                  height: 60.h,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 32.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              planList[index],
                              style: myTextStyle.titleSmall,
                            ),
                            SvgPicture.asset(width: 24.w, iconUrl)
                          ],
                        ),
                      ),
                      Divider(
                        height: 0.h,
                        thickness: 1.w,
                        color: AppColors.greyColor.withOpacity(0.3),
                      )
                    ],
                  ),
                )),
      ),
    );
  }
}
