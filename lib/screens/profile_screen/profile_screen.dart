import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage/routes/app_routes.dart';
import 'package:islamic_marriage/services/shared_preference_service.dart';
import 'package:islamic_marriage/utils/app_colors.dart';
import 'package:islamic_marriage/utils/app_text_styles.dart';
import 'package:islamic_marriage/utils/app_urls.dart';
import 'package:islamic_marriage/widgets/custom_bottom_sheet.dart';
import 'package:islamic_marriage/widgets/custom_elevated_button.dart';
import 'package:islamic_marriage/screens/profile_screen/widgets/custom_button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
            _buildProfileAvatar(),
            Gap(16.h),
            CustomElevatedButton(
              onPressed: () {
                Get.toNamed(AppRoutes.myBioDataScreen);
              },
              buttonName: 'My Bio Data',
              buttonWidth: 140.w,
              buttonHeight: 45.h,
            ),
            Gap(16.h),
            CustomButton(
              onTap: () {
                Get.toNamed(AppRoutes.bioDataManagementScreen);
              },
              iconData: FontAwesomeIcons.penToSquare,
              title: 'Edit Bio Data',
            ),
            Gap(8.h),
            CustomButton(
              onTap: () {
                Get.toNamed(AppRoutes.subscriptionScreen);
              },
              iconData: Icons.subscriptions,
              title: 'Subscription',
            ),
            Gap(8.h),
            CustomButton(
              onTap: () {
                Get.toNamed(AppRoutes.addressViewScreen);
              },
              iconData: FontAwesomeIcons.addressBook,
              title: 'Address',
            ),
            Gap(8.h),
            CustomButton(
              onTap: () {
                Get.toNamed(AppRoutes.cartScreen);
              },
              iconData: Icons.shopping_bag,
              title: 'My Bag',
            ),
            Gap(8.h),
            CustomButton(
              onTap: () {
                Get.toNamed(AppRoutes.helpCenterScreen);
              },
              iconData: Icons.help_center,
              title: 'Help Center',
            ),
            Gap(8.h),
            CustomButton(
                onTap: () {
                  Get.toNamed(AppRoutes.privacyPolicyScreen);
                },
                iconData: FontAwesomeIcons.shieldHalved,
                title: 'Privacy Policy'),
            Gap(8.h),
            CustomButton(
              onTap: () {
                Get.toNamed(AppRoutes.aboutUsScreen);
              },
              iconData: Icons.info,
              title: 'About Us',
            ),
            Gap(8.h),
            CustomButton(
                onTap: () {
                  _showLogoutBottomSheet();
                },
                iconData: FontAwesomeIcons.rightFromBracket,
                title: 'Logout')
          ],
        ),
      ),
    );
  }

  GestureDetector _buildProfileAvatar() {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRoutes.profileUpdateScreen);
      },
      child: Stack(
        children: [
          SizedBox(
            height: 110.h,
            width: 110.w,
            child: CircleAvatar(
              foregroundImage: AssetImage(AppUrls.placeHolderPng),
            ),
          ),
          Positioned(
            top: 4,
            right: 4,
            child: FaIcon(
              FontAwesomeIcons.penToSquare,
              size: 25.sp,
              color: AppColors.purpleClr,
            ),
          ),
        ],
      ),
    );
  }

  void _showLogoutBottomSheet() {
    Get.bottomSheet(
      CustomBottomSheet(
        children: [
          Center(
              child: Container(
                  height: 5.h,
                  width: 60.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.r),
                      color: AppColors.violetClr))),
          Gap(16.h),
          Center(child: Text('Logout', style: AppTextStyles.titleLarge())),
          Gap(16.h),
          Center(
              child: Text('Are you sure want to logout?',
                  style: AppTextStyles.bodyMedium())),
          Gap(16.h),
          Row(
            children: [
              Expanded(
                  child: CustomElevatedButton(
                      onPressed: () => Get.back(), buttonName: 'Cancel')),
              Gap(32.w),
              Expanded(
                  child: CustomElevatedButton(
                      onPressed: () {
                        SharedPreferencesService().clearUserData();
                        Get.offAllNamed(AppRoutes.signInScreen);
                      },
                      buttonName: 'Logout'))
            ],
          ),
          Gap(32.h)
        ],
      ),
    );
  }
}
