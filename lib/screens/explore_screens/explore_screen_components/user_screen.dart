import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:islamic_marriage/screens/explore_screens/model/users_model.dart';
import 'package:islamic_marriage/utils/app_colors.dart';
import 'package:islamic_marriage/utils/app_text_styles.dart';
import 'package:islamic_marriage/utils/app_urls.dart';
import 'package:islamic_marriage/widgets/custom_card.dart';
import 'package:islamic_marriage/widgets/custom_elevated_button.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity.h,
      width: double.infinity.w,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Gap(16.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                    text: TextSpan(
                        text: 'Welcome! ',
                        style: AppTextStyles.bodyMedium(),
                        children: [
                      TextSpan(
                          text: 'MD. SAYMON', style: AppTextStyles.titleMedium())
                    ])),
                GestureDetector(
                  onTap: () {},
                  child: SvgPicture.asset(AppUrls.filterSvg,
                      height: 20.h, width: 20.w),
                )
              ],
            ),
            Gap(4.h),
            Text(
              "Let's find your soulmate",
              style: AppTextStyles.bodySmall()
            ),
            Gap(8.h),
            Flexible(
              child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final user = UsersModel.userList[index];
                  return CustomCard(
                    height: 220.h,
                    border: Border.all(color: AppColors.violetClr, width: 1.w),
                    padding: EdgeInsets.only(bottom: 4.h),
                    child: Row(
                      children: [
                        SizedBox(
                          height: 130.h,
                          width: 130.w,
                          child: CircleAvatar(
                            foregroundImage: AssetImage(AppUrls.placeHolderPng),
                          ),
                        ),
                        Gap(4.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        user.name,
                                        style: AppTextStyles.titleMedium()
                                      ),
                                      Gap(4.w),
                                      Icon(
                                        Icons.verified_outlined,
                                        size: 15.sp,
                                        color: AppColors.violetClr
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(right: 16.w),
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          user.toggleFavourite();
                                        });
                                      },
                                      child: Icon(
                                          user.isFavourite
                                              ? Icons.favorite
                                              : Icons.favorite_outline,
                                          size: 25.sp,
                                          color: Colors.red),
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                '25 years 5 months, 5 ft 2 in/160 cm',
                                style: AppTextStyles.bodySmall(color: AppColors.greyColor),
                              ),
                              Text(
                                'Mohakhali, Dhaka',
                                style: AppTextStyles.bodyMedium(color: AppColors.greyColor),
                              ),
                              Text(
                                'Diploma Engineering',
                                style: AppTextStyles.bodyMedium(color: AppColors.greyColor),
                              ),
                              Text(
                                'Self-employment',
                                style: AppTextStyles.bodyMedium(color: AppColors.greyColor)
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.green,
                                    radius: 4.r,
                                  ),
                                  Gap(4.w),
                                  Text(
                                    'Active Now',
                                    style: AppTextStyles.bodyMedium(color: Colors.green)
                                  ),
                                ],
                              ),
                              CustomElevatedButton(
                                onPressed: () {},
                                buttonName: 'Send Invitation',
                                buttonHeight: 30.h,
                                buttonWidth: 130.w,
                                style: AppTextStyles.titleSmall(color: AppColors.whiteClr)
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) => Gap(8.h),
                itemCount: UsersModel.userList.length,
              ),
            ),
            Gap(8.h),
          ],
        ),
      ),
    );
  }
}
