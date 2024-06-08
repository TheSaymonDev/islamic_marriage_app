import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage/screens/message_screen/message_screen.dart';
import 'package:islamic_marriage/utils/app_colors.dart';
import 'package:islamic_marriage/utils/app_text_styles.dart';
import 'package:islamic_marriage/utils/app_urls.dart';
import 'package:islamic_marriage/widgets/custom_search_text_field.dart';

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity.h,
      width: double.infinity.w,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          Gap(16.h),
          const CustomSearchTextField(),
          Gap(32.h),
          Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: () {
                          Get.to(() => MessageScreen());
                        },
                        child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Stack(
                                      children: [
                                        SizedBox(
                                            height: 55.h,
                                            width: 55.w,
                                            child: const CircleAvatar(
                                                foregroundImage: AssetImage(
                                                    AppUrls.photoPng))),
                                        Positioned(
                                            bottom: 3,
                                            right: 3,
                                            child: CircleAvatar(
                                                backgroundColor: Colors.green,
                                                radius: 6.r))
                                      ],
                                    ),
                                    Gap(16.w),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('Saymon',
                                            style: AppTextStyles.titleMedium()),
                                        Gap(4.h),
                                        Text('Hello are you home?',
                                            style: AppTextStyles.bodySmall(
                                                color: AppColors.greyColor))
                                      ],
                                    ),
                                    const Spacer(),
                                    Column(
                                      children: [
                                        Text('1:35PM',
                                            style: AppTextStyles.bodyMedium(
                                                color: AppColors.greyColor)),
                                        Container(
                                            height: 20.h,
                                            width: 20.w,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: AppColors.purpleClr
                                                    .withOpacity(0.3)),
                                            child: Text('1',
                                                style: AppTextStyles.titleSmall(
                                                    color: AppColors.whiteClr)))
                                      ],
                                    )
                                  ],
                                ),
                                Divider(
                                    color: AppColors.greyColor.withOpacity(0.3),
                                    thickness: 1.w)
                              ],
                            )));
                  },
                  separatorBuilder: (context, index) => Gap(16.h),
                  itemCount: 10))
        ],
      ),
    );
  }
}
