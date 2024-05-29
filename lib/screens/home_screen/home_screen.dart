import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:islamic_marriage/screens/chat_list_screen/chat_list_screen.dart';
import 'package:islamic_marriage/screens/explore_screens/explore_screen.dart';
import 'package:islamic_marriage/screens/help_mate_screen/help_mate_screen.dart';
import 'package:islamic_marriage/screens/my_bio_data_screen/controller/my_bio_data_controller.dart';
import 'package:islamic_marriage/screens/profile_screen/profile_screen.dart';
import 'package:islamic_marriage/screens/shop_screen/shop_screen.dart';
import 'package:islamic_marriage/utils/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final List<Widget> _widgetOptions = [
    const ExploreScreen(),
    const HelpMateScreen(),
    const ShopScreen(),
    const ChatListScreen(),
    const ProfileScreen(),
  ];

  int _selectedIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.find<MyBioDataController>().readMyBioData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteClr,
      body: SafeArea(child: _widgetOptions.elementAt(_selectedIndex)),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            child: GNav(
              rippleColor: AppColors.purpleClr,
              hoverColor: Colors.grey[100]!,
              gap: 8.w,
              activeColor: AppColors.purpleClr,
              iconSize: 24.sp,
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              duration: const Duration(milliseconds: 400),
              tabBackgroundColor: Colors.grey[100]!,
              color: AppColors.violetClr,
              tabs: const [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.supervised_user_circle,
                  text: 'Help Mate',
                ),
                GButton(
                  icon: Icons.shopify,
                  text: 'Shop',
                ),
                GButton(
                  icon: Icons.comment,
                  text: 'Message',
                ),
                GButton(
                  icon: Icons.person,
                  text: 'Profile',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
