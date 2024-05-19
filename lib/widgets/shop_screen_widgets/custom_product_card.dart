import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage/screens/product_details_screen/product_details_screen.dart';
import 'package:islamic_marriage/utils/app_colors.dart';
import 'package:islamic_marriage/utils/app_text_styles.dart';
import 'package:islamic_marriage/utils/app_urls.dart';

class CustomProductCard extends StatelessWidget {
  const CustomProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.to(()=> ProductDetailsScreen());
      },
      child: Card(
        color: AppColors.whiteClr,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
        child: Container(
          height: 310.h,
          width: 182.w,
          decoration: BoxDecoration(
              color: AppColors.whiteClr,
              borderRadius: BorderRadius.circular(8.r)),
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 210.h,
                    width: double.infinity.w,
                    decoration: BoxDecoration(
                        color: AppColors.purple50Clr,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8.r),
                          topRight: Radius.circular(8.r),
                        ),
                        image: DecorationImage(
                            image: AssetImage(AppUrls.demoProductPng))),
                  ),
                  Positioned(
                    right: 10,
                    top: 10,
                    child: InkWell(
                      onTap: (){},
                      borderRadius: BorderRadius.circular(20.r),
                      child: CircleAvatar(
                        radius: 18.r,
                        backgroundColor: AppColors.whiteClr,
                        child: Icon(Icons.shopping_bag_outlined,
                            size: 20.sp, color: AppColors.blackClr),
                      ),
                    ),
                  )
                ],
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 8.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Gucci duffle Cap',
                        style: AppTextStyles.titleMedium(),
                      ),
                      Row(
                        children: [
                          Text('${AppUrls.takaSign}100',
                              style: AppTextStyles.titleMedium(
                                  color: AppColors.purpleClr)),
                          Gap(16.w),
                          Text('${AppUrls.takaSign}150',
                              style: AppTextStyles.titleMedium(
                                  color: AppColors.greyColor,
                                  textDecoration: TextDecoration.lineThrough)),
                        ],
                      ),
                      Row(
                        children: [
                          Wrap(
                            children: List.generate(
                                5,
                                (index) => Icon(
                                      Icons.star,
                                      color: AppColors.yellowClr,
                                      size: 20.sp,
                                    )),
                          ),
                          Gap(16.w),
                          Text('(65)',
                              style: AppTextStyles.titleSmall(
                                  color: AppColors.greyColor))
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
