import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:islamic_marriage/utils/app_text_styles.dart';
import 'package:islamic_marriage/widgets/custom_search_text_field.dart';
import 'package:islamic_marriage/screens/shop_screen/widgets/custom_category_card.dart';
import 'package:islamic_marriage/screens/shop_screen/widgets/custom_product_card.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity.h,
      width: double.infinity.w,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Gap(16.h),
            const CustomSearchTextField(),
            Gap(16.h),
            SizedBox(
              height: 310.h,
              width: double.infinity.w,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return const CustomProductCard();
                  },
                  separatorBuilder: (context, index) => Gap(16.w),
                  itemCount: 10),
            ),
            Gap(8.h),
            Text('Categories', style: AppTextStyles.titleLarge()),
            SizedBox(
              height: 56.h,
              width: double.infinity.w,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return CustomCategoryCard();
                  },
                  separatorBuilder: (context, index) => Gap(16.w),
                  itemCount: 10),
            ),
            Gap(8.h),
            SizedBox(
              height: 310.h,
              width: double.infinity.w,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return const CustomProductCard();
                  },
                  separatorBuilder: (context, index) => Gap(16.w),
                  itemCount: 10),
            ),
            Gap(8.h),
            SizedBox(
              height: 310.h,
              width: double.infinity.w,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return const CustomProductCard();
                  },
                  separatorBuilder: (context, index) => Gap(16.w),
                  itemCount: 10),
            ),
            Gap(8.h),
            SizedBox(
              height: 310.h,
              width: double.infinity.w,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return const CustomProductCard();
                  },
                  separatorBuilder: (context, index) => Gap(16.w),
                  itemCount: 10),
            ),
          ],
        ),
      ),
    );
  }
}
