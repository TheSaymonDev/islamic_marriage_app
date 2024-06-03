import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage/utils/app_colors.dart';
import 'package:islamic_marriage/utils/app_text_styles.dart';
import 'package:islamic_marriage/utils/app_urls.dart';

class StepSummaryWidget extends StatefulWidget {
  //final List<CartItem> cartItemList;
  //final int totalAmount;
  const StepSummaryWidget(
      {super.key});

  @override
  State<StepSummaryWidget> createState() => _StepSummaryWidgetState();
}

class _StepSummaryWidgetState extends State<StepSummaryWidget> {


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: ListView.separated(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                //final item = widget.cartItemList[index];
                return SizedBox(
                  width: double.infinity,
                  height: 100.h,
                  child: Row(
                    children: [
                      Container(
                        width: 100.w,
                        height: double.infinity.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.r),
                            image: DecorationImage(
                                image: AssetImage(
                                    '${AppUrls.demoPanjabiPng}'),
                                fit: BoxFit.cover)),
                      ),
                      Gap(40.w),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Panjabi',
                            style: AppTextStyles.bodyLarge(),
                          ),
                          Row(
                            children: [
                              Text(
                                  '${AppUrls.takaSign}700',
                                  style: AppTextStyles.bodyMedium(color: AppColors.violetClr)),
                              Gap(48.w),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                    size: 20.sp,
                                  ),
                                  Text('4.5', style: AppTextStyles.bodyMedium())
                                ],
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'Size: L',
                                style: AppTextStyles.bodyMedium(),
                              ),
                              Gap(48.w),
                              Text('Quantity: 4',
                                  style: AppTextStyles.bodyMedium())
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) => Gap(16.h),
              itemCount: 2),
        ),
        Divider(
          color: AppColors.violetClr.withOpacity(0.3),
          thickness: 1.h,
        ),
        Text(
          'Shipping Address',
          style: Get.textTheme.titleLarge,
        ),
        Gap(16.h),
        // GetBuilder<StepAddressController>(builder: (controller) {
        //   return Column(
        //     children: [
        //       Row(
        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //         children: [
        //           Text('Md. Saymon',
        //               style: Get.textTheme.titleMedium),
        //           Text('01643831739',
        //               style:
        //               Get.textTheme.titleMedium!.copyWith(color: AppColors.greyColor))
        //         ],
        //       ),
        //       Row(
        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //         children: [
        //           Expanded(
        //               child: Text(
        //                   'Bhani, Dharoga Bari, 3511\nDebidwar, Cumilla, Chittagong',
        //                   style: Get.textTheme.bodyMedium)),
        //           Checkbox(
        //             value: true,
        //             onChanged: (newValue) {},
        //             activeColor: AppColors.violetClr,
        //             shape: const CircleBorder(),
        //           )
        //         ],
        //       ),
        //     ],
        //   );
        // }),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Md. Saymon',
                    style: AppTextStyles.titleMedium()),
                Text('01643831739',
                    style:
                    AppTextStyles.titleMedium(color: AppColors.greyColor))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: Text(
                        'Bhani, Dharoga Bari, 3511\nDebidwar, Cumilla, Chittagong',
                        style: AppTextStyles.bodyMedium())),
                Checkbox(
                  value: true,
                  onChanged: (newValue) {},
                  activeColor: AppColors.violetClr,
                  shape: const CircleBorder(),
                )
              ],
            ),
          ],
        ),
        Divider(
          color: AppColors.violetClr.withOpacity(0.3),
          thickness: 1.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Delivery charge', style: AppTextStyles.bodyMedium()),
            Text('----------------------',
                style: AppTextStyles.bodyMedium(color: AppColors.violetClr)),
            Text('${AppUrls.takaSign}120', style: AppTextStyles.bodyMedium())
          ],
        ),
        Gap(16.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Total Amount', style: AppTextStyles.bodyMedium()),
            Text('----------------------',
                style: AppTextStyles.bodyMedium(color: AppColors.violetClr)),
            Text('${AppUrls.takaSign}1400',
                style: AppTextStyles.bodyMedium())
          ],
        ),
        Divider(
          color: AppColors.violetClr.withOpacity(0.3),
          thickness: 1.h,
        ),
      ],
    );
  }
}
