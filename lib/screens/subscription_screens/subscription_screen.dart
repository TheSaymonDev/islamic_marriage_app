import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage/screens/home_screen/home_screen.dart';
import 'package:islamic_marriage/screens/subscription_screens/subscription_screen_components/choose_plan_screen.dart';
import 'package:islamic_marriage/screens/subscription_screens/subscription_screen_components/free_plan_screen.dart';
import 'package:islamic_marriage/screens/subscription_screens/subscription_screen_components/my_purchase_plan_screen.dart';
import 'package:islamic_marriage/screens/subscription_screens/subscription_screen_components/payment_screen.dart';
import 'package:islamic_marriage/screens/subscription_screens/subscription_screen_components/payment_successful_screen.dart';
import 'package:islamic_marriage/screens/subscription_screens/subscription_screen_components/summary_screen.dart';
import 'package:islamic_marriage/widgets/common_widgets/custom_appbar/appbar_textview_with_back.dart';
import 'package:islamic_marriage/widgets/common_widgets/custom_elevated_button.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({super.key});

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  final _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(onPressedBack: (){
        Get.back();
      }, title: 'Subscriptions',),
      body: Container(
        height: double.infinity.h,
        width: double.infinity.w,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child:Column(
          children: [
            Expanded(
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: _pageController,
                onPageChanged: (newValue){
                  setState(() {
                    _currentPage = newValue;
                  });
                },
                children: const [
                  FreePlanScreen(),
                  ChoosePlanScreen(),
                  SummaryScreen(),
                  PaymentScreen(),
                  PaymentSuccessfulScreen(),
                  MyPurchasePlanScreen()
                ],
              ),
            ),
            CustomElevatedButton(onPressed: (){
             if(_currentPage==5){
               Get.to(()=>const HomeScreen());
             }else{
               _pageController.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
             }
            }, buttonName: _currentPage==0? 'Upgrade Plan' : _currentPage==3? 'Pay' : 'Continue'),
            Gap(32.h),
          ],
        ),
      ),
    );
  }
}
