import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islamic_marriage/utils/app_urls.dart';
import 'package:islamic_marriage/widgets/common_widgets/custom_expansion_tile.dart';

class FaqScreen extends StatelessWidget {
  const FaqScreen({super.key});

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
            title: 'What is Islamic Marriage?',
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Text(
                  AppUrls.loremData,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              )
            ],
          ),
          CustomExpansionTile(
            leading: false,
            title: 'How do I start a lesson?',
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Text(
                  AppUrls.loremData,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              )
            ],
          ),
          CustomExpansionTile(
            leading: false,
            title: 'How do I upgrade account?',
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Text(
                  AppUrls.loremData,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              )
            ],
          ),
          CustomExpansionTile(
            leading: false,
            title: 'How do I close account?',
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Text(
                  AppUrls.loremData,
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
