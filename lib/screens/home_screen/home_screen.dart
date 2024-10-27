import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:islamic_marriage/screens/chat_list_screen/chat_list_screen.dart';
import 'package:islamic_marriage/screens/explore_screens/explore_screen.dart';
import 'package:islamic_marriage/screens/help_mate_screen/help_mate_screen.dart';
import 'package:islamic_marriage/screens/home_screen/controllers/bottom_nav_controller.dart';
import 'package:islamic_marriage/screens/plan_screen/plan_screen.dart';
import 'package:islamic_marriage/screens/profile_screen/profile_screen.dart';
import 'package:islamic_marriage/utils/app_colors.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<Widget> _widgetOptions = [
    const ExploreScreen(),
    const HelpMateScreen(),
    // const ShopScreen(),
    PlanScreen(),
    const ChatListScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavController>(builder: (controller) {
      return Scaffold(
        body:
            SafeArea(child: _widgetOptions.elementAt(controller.selectedIndex)),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: lightBgClr,
            boxShadow: [
              BoxShadow(
                blurRadius: 20,
                color: Colors.black.withValues(alpha: .1),
              )
            ],
          ),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              child: GNav(
                rippleColor: purpleClr,
                hoverColor: Colors.grey[100]!,
                gap: 8.w,
                activeColor: purpleClr,
                iconSize: 24.sp,
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                duration: const Duration(milliseconds: 400),
                tabBackgroundColor: Colors.grey[100]!,
                color: violetClr,
                tabs: [
                  GButton(
                    icon: Icons.home,
                    text: 'nav1'.tr,
                  ),
                  GButton(
                    icon: Icons.supervised_user_circle,
                    text: 'nav2'.tr,
                  ),
                  // GButton(
                  //   icon: Icons.shopify,
                  //   text: 'nav3'.tr,
                  // ),
                  GButton(
                    icon: Icons.subscriptions,
                    text: 'nav3'.tr,
                  ),
                  GButton(
                    icon: Icons.comment,
                    text: 'nav4'.tr,
                  ),
                  GButton(icon: Icons.person, text: 'nav5'.tr),
                ],
                selectedIndex: controller.selectedIndex,
                onTabChange: controller.changeScreen,
              ),
            ),
          ),
        ),
      );
    });
  }
}
