import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage/screens/help_center_screen/widgets/contact_us_screen.dart';
import 'package:islamic_marriage/screens/help_center_screen/widgets/faq_screen.dart';
import 'package:islamic_marriage/utils/app_colors.dart';
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
              labelStyle: Theme.of(context).textTheme.titleMedium,
              unselectedLabelStyle: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: greyClr),
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorColor: violetClr,
              indicatorWeight: 2.w,
              tabs: <Widget>[
                Tab(
                  child: Center(
                    child: Text(
                      'faq'.tr,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Tab(
                  child: Center(
                    child: Text(
                      'contactUs'.tr,
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              ],
            ),
          ),
          body: const TabBarView(children: [FaqWidget(), ContactUsWidget()]),
        ));
  }
}
