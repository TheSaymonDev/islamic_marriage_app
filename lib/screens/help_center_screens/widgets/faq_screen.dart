import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage/widgets/custom_expansion_tile.dart';

class FaqWidget extends StatelessWidget {
  const FaqWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity.h,
      width: double.infinity.w,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Column(
        children: [
          CustomExpansionTile(
            leading: false,
            title: 'faqQue1'.tr,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Text(
                  'faqAns1'.tr,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              )
            ],
          ),
          CustomExpansionTile(
            leading: false,
            title: 'faqQue2'.tr,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Text(
                  'faqAns2'.tr,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              )
            ],
          ),
          CustomExpansionTile(
            leading: false,
            title: 'faqQue3'.tr,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Text(
                  'faqAns3'.tr,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
