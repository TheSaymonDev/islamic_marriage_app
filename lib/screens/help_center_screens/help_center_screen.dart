import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage/screens/help_center_screens/widgets/contact_us_screen.dart';
import 'package:islamic_marriage/screens/help_center_screens/widgets/faq_screen.dart';
import 'package:islamic_marriage/utils/app_colors.dart';
import 'package:islamic_marriage/utils/app_text_styles.dart';
import 'package:islamic_marriage/widgets/custom_appbar/custom_appbar.dart';

class HelpCenterScreen extends StatelessWidget {
  const HelpCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: CustomAppbar(
            onPressedBack: () {
              Get.back();
            },
            title: 'helpCenter'.tr,
            tabBar: TabBar(
              indicatorColor: AppColors.violetClr,
              indicatorWeight: 4.w,
              indicatorSize: TabBarIndicatorSize.tab,
              unselectedLabelStyle: AppTextStyles.titleMedium(color: AppColors.greyColor),
              labelStyle: AppTextStyles.titleMedium(),
              tabs: const <Widget>[
                Tab(
                  text: 'FAQ',
                ),
                Tab(
                  text: 'CONTACT US',
                ),
              ],
            ),
          ),
          body: const TabBarView(children: [
            FaqScreen(),
            ContactUsScreen()
          ]),
        ));
  }
}
