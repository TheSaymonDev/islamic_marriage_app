import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage/routes/app_routes.dart';
import 'package:islamic_marriage/services/shared_preference_service.dart';
import 'package:islamic_marriage/utils/app_colors.dart';
import 'package:islamic_marriage/utils/app_urls.dart';
import 'package:islamic_marriage/widgets/custom_bottom_sheet.dart';
import 'package:islamic_marriage/widgets/custom_elevated_button.dart';
import 'package:islamic_marriage/screens/profile_screen/widgets/custom_button.dart';
import 'package:islamic_marriage/widgets/custom_profile_avatar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity.h,
      width: double.infinity.w,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Gap(16.h),
            CustomProfileAvatar(
              onTap: () {
                Get.toNamed(AppRoutes.profileUpdateScreen);
              },
              iconData: FontAwesomeIcons.penToSquare,
              foregroundImage: AssetImage(AppUrls.placeHolderPng),
            ),
            Gap(16.h),
            CustomElevatedButton(
              onPressed: () {
                Get.toNamed(AppRoutes.myBioDataScreen);
              },
              buttonName: 'myBioData'.tr,
              buttonWidth: 170.w,
              buttonHeight: 45.h,
            ),
            Gap(16.h),
            // CustomButton(
            //   onTap: () {
            //     Get.toNamed(AppRoutes.profileUpdateScreen);
            //   },
            //   iconData: FontAwesomeIcons.circleUser,
            //   title: 'profileUpdate'.tr
            // ),
            // Gap(8.h),
            CustomButton(
              onTap: () {
                Get.toNamed(AppRoutes.bioDataManagementScreen);
              },
              iconData: FontAwesomeIcons.penToSquare,
              title: 'editBioData'.tr,
            ),
            Gap(8.h),
            CustomButton(
              onTap: () {
                Get.toNamed(AppRoutes.wishlistScreen);
              },
              iconData: FontAwesomeIcons.shieldHeart,
              title: 'wishlist'.tr,
            ),
            Gap(8.h),
            CustomButton(
              onTap: () {
                Get.toNamed(AppRoutes.addressViewScreen);
              },
              iconData: FontAwesomeIcons.addressBook,
              title: 'address'.tr,
            ),
            Gap(8.h),
            CustomButton(
              onTap: () {
                Get.toNamed(AppRoutes.cartScreen);
              },
              iconData: Icons.shopping_bag,
              title: 'myBag'.tr,
            ),
            Gap(8.h),
            CustomButton(
              onTap: () {
                Get.toNamed(AppRoutes.helpCenterScreen);
              },
              iconData: Icons.help_center,
              title: 'helpCenter'.tr,
            ),
            Gap(8.h),
            CustomButton(
                onTap: () {
                  Get.toNamed(AppRoutes.privacyPolicyScreen);
                },
                iconData: FontAwesomeIcons.shieldHalved,
                title: 'privacyPolicy'.tr),
            Gap(8.h),
            CustomButton(
              onTap: () {
                Get.toNamed(AppRoutes.aboutUsScreen);
              },
              iconData: Icons.info,
              title: 'aboutUs'.tr,
            ),
            Gap(8.h),
            CustomButton(
                onTap: () {
                  _showLogoutBottomSheet(context);
                },
                iconData: FontAwesomeIcons.rightFromBracket,
                title: 'logout'.tr)
          ],
        ),
      ),
    );
  }

  void _showLogoutBottomSheet(BuildContext context) {
    Get.bottomSheet(
      CustomBottomSheet(
        children: [
          Center(
              child: Container(
                  height: 5.h,
                  width: 60.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.r),
                      color: violetClr))),
          Gap(32.h),
          Center(
              child: Text('logout'.tr,
                  style: Theme.of(context).textTheme.titleLarge)),
          Gap(16.h),
          Center(
              child: Text('areYouSure'.tr,
                  style: Theme.of(context).textTheme.bodyMedium)),
          Gap(32.h),
          Row(
            children: [
              Expanded(
                  child: CustomElevatedButton(
                      onPressed: () => Get.back(), buttonName: 'cancelBtn'.tr)),
              Gap(32.w),
              Expanded(
                  child: CustomElevatedButton(
                      onPressed: () {
                        SharedPreferencesService().clearUserData();
                        Get.offAllNamed(AppRoutes.signInScreen);
                      },
                      buttonName: 'logout'.tr))
            ],
          ),
          Gap(32.h)
        ],
      ),
    );
  }
}
