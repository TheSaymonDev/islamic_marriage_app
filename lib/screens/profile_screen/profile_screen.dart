import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage/screens/cart_screen/cart_screen.dart';
import 'package:islamic_marriage/screens/create_bio_data_screen/create_bio_data_screen.dart';
import 'package:islamic_marriage/screens/help_center_screens/help_center_screen.dart';
import 'package:islamic_marriage/screens/my_bio_data_screen/my_bio_data_screen.dart';
import 'package:islamic_marriage/screens/sign_in_screen/sign_in_screen.dart';
import 'package:islamic_marriage/screens/subscription_screens/subscription_screen.dart';
import 'package:islamic_marriage/services/shared_preference_service.dart';
import 'package:islamic_marriage/utils/app_colors.dart';
import 'package:islamic_marriage/utils/app_text_styles.dart';
import 'package:islamic_marriage/utils/app_urls.dart';
import 'package:islamic_marriage/widgets/common_widgets/custom_bottom_sheet.dart';
import 'package:islamic_marriage/widgets/common_widgets/custom_elevated_button.dart';
import 'package:islamic_marriage/widgets/profile_widgets/custom_button.dart';


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
              SizedBox(
                height: 110.h,
                width: 110.w,
                child: CircleAvatar(
                  foregroundImage: AssetImage(AppUrls.photoPng),
                ),
              ),
              Gap(16.h),
              CustomElevatedButton(
                onPressed: () {
                  Get.to(() => MyBioDataScreen());
                },
                buttonName: 'My Bio Data',
                buttonWidth: 140.w,
                buttonHeight: 45.h,
              ),
              Gap(16.h),
              CustomButton(
                onTap: () {
                  Get.to(() => const CreateBioDataScreen());
                },
                iconData: FontAwesomeIcons.penToSquare,
                title: 'Edit Bio Data',
              ),
              Gap(8.h),
              CustomButton(
                onTap: () {
                  Get.to(() => const SubscriptionScreen());
                },
                iconData: Icons.subscriptions,
                title: 'Subscription',
              ),
              Gap(8.h),
              CustomButton(
                onTap: () {},
                iconData: Icons.notifications_active,
                title: 'Notifications',
              ),
              Gap(8.h),
              CustomButton(
                onTap: () {
                  Get.to(()=>  CartScreen());
                },
                iconData: Icons.shopping_bag,
                title: 'My Bag',
              ),
              // CustomCard(
              //   height: 56.h,
              //   padding: EdgeInsets.symmetric(horizontal: 16.w),
              //   border: Border.all(color: violetClr, width: 1.w),
              //   cardClr: const Color(0xFFE6E6E6),
              //   child: Row(
              //     children: [
              //       Icon(
              //         Icons.language,
              //         size: 22.sp,
              //         color: blackClr,
              //       ),
              //       Gap(16.w),
              //       Text(
              //         _isLanguage==true? 'বাংলা' : 'English',
              //         style: Theme.of(context).textTheme.bodyMedium,
              //       ),
              //       const Spacer(),
              //       CustomFlutterSwitch(
              //           onToggle: (value) {
              //             setState(() {
              //               _isLanguage = value;
              //             });
              //           },
              //           value: _isLanguage),
              //     ],
              //   ),
              // ),
              Gap(8.h),
              CustomButton(
                onTap: () {
                  Get.to(() => const HelpCenterScreen());
                },
                iconData: Icons.help_center,
                title: 'Help Center',
              ),
              Gap(8.h),
              CustomButton(onTap: (){}, iconData: FontAwesomeIcons.shieldHalved, title: 'Privacy Policy'),
              Gap(8.h),
              CustomButton(
                onTap: () {},
                iconData: Icons.info,
                title: 'About Us',
              ),
              Gap(8.h),
              CustomButton(
                onTap: () {
                  Get.bottomSheet(CustomBottomSheet(children: [
                    Center(
                      child: Container(
                        height: 5.h,
                        width: 60.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.r),
                            color: AppColors.violetClr)
                      ),
                    ),
                    Gap(16.h),
                    Center(
                        child: Text(
                      'Logout',
                      style: AppTextStyles.titleLarge()
                    )),
                    Gap(16.h),
                    Center(
                        child: Text(
                      'Are you sure want to logout?',
                      style: AppTextStyles.bodyMedium()
                    )),
                    Gap(16.h),
                    Row(
                      children: [
                        Expanded(
                            child: CustomElevatedButton(
                                onPressed: () {
                                  Get.back();
                                },
                                buttonName: 'Cancel')),
                        Gap(32.w),
                        Expanded(
                            child: CustomElevatedButton(
                                onPressed: () {
                                  SharedPreferencesService().clearUserData();
                                  Get.offAll(() => const SignInScreen());
                                },
                                buttonName: 'Logout'))
                      ],
                    ),
                    Gap(32.h)
                  ]));
                },
                iconData: FontAwesomeIcons.rightFromBracket,
                title: 'Logout',
              ),
            ],
          ),
        ));
  }
}
