import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage/screens/product_details_screen/controller/product_des_controller.dart';
import 'package:islamic_marriage/utils/app_colors.dart';
import 'package:islamic_marriage/utils/app_text_styles.dart';
import 'package:islamic_marriage/utils/app_urls.dart';
import 'package:islamic_marriage/widgets/common_widgets/custom_appbar/appbar_textview_with_back.dart';
import 'package:islamic_marriage/widgets/common_widgets/custom_card.dart';
import 'package:islamic_marriage/widgets/common_widgets/custom_elevated_button.dart';
import 'package:islamic_marriage/widgets/product_details_widgets/increment_decrement_button.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});

  final ProductDesController productDesController = Get.put(ProductDesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        onPressedBack: () {
          Get.back();
        },
        title: 'My Bag',
      ),
      body: SizedBox(
        height: double.infinity.h,
        width: double.infinity.w,
        child: Column(
          children: [
            Expanded(
                flex: 10,
                child: Container(
                  height: double.infinity.h,
                  width: double.infinity.w,
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        return CustomCard(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.w, vertical: 10.h),
                          child: Row(
                            children: [
                              Container(
                                height: 80.h,
                                width: 80.w,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            AppUrls.demoPanjabiPng))),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Panjabi',
                                          style: AppTextStyles.titleMedium(),
                                        ),
                                        Container(
                                          height: 26.h,
                                          width: 26.w,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5.r),
                                              color: AppColors.purple50Clr),
                                          child: Icon(
                                              Icons.delete_forever_outlined,
                                              color: AppColors.blackClr,
                                              size: 15.sp),
                                        )
                                      ],
                                    ),
                                    Text('Size: M', style: AppTextStyles.bodyMedium()),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Price: ${AppUrls.takaSign}200', style: AppTextStyles.titleMedium()),
                                        Container(
                                          height: 45.h,
                                          width: 125.w,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(10.r),
                                              color: AppColors.filledClr),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              IncrementDecrementButton(
                                                  iconData: Icons.remove,
                                                  onTap: ()=> productDesController.decrementQuantity()),
                                              GetBuilder<ProductDesController>(
                                                  builder: (controller) {
                                                    return Text(controller.quantity.toString(),
                                                        style:
                                                        AppTextStyles.bodyMedium());
                                                  }
                                              ),
                                              IncrementDecrementButton(
                                                  iconData: Icons.add,
                                                  onTap: ()=> productDesController.incrementQuantity(10))
                                            ],
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => Gap(8.h),
                      itemCount: 10),
                )),
            Expanded(
                flex: 3,
                child: Container(
                  height: double.infinity.h,
                  width: double.infinity.w,
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(8.r),
                        topLeft: Radius.circular(8.r)),
                    color: AppColors.whiteClr,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 0,
                        blurRadius: 3,
                        offset: const Offset(0, -3), // Offset for top shadow
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Sub-total',
                              style: AppTextStyles.bodyMedium(
                                  color: AppColors.greyColor)),
                          Text('${AppUrls.takaSign}2000',
                              style: AppTextStyles.bodyMedium())
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Delivery Charge',
                              style: AppTextStyles.bodyMedium(
                                  color: AppColors.greyColor)),
                          Text('${AppUrls.takaSign}100',
                              style: AppTextStyles.bodyMedium())
                        ],
                      ),
                      const Divider(color: AppColors.greyColor),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Total', style: AppTextStyles.titleMedium()),
                          Text('${AppUrls.takaSign}2100',
                              style: AppTextStyles.titleMedium())
                        ],
                      ),
                      CustomElevatedButton(
                          onPressed: () {}, buttonName: 'Checkout')
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
