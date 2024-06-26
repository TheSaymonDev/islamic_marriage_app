import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage/screens/home_screen/home_screen.dart';
import 'package:islamic_marriage/screens/subscription_screens/widgets/choose_plan_widget.dart';
import 'package:islamic_marriage/screens/subscription_screens/widgets/free_plan_widget.dart';
import 'package:islamic_marriage/screens/subscription_screens/widgets/my_purchase_plan_widget.dart';
import 'package:islamic_marriage/screens/subscription_screens/widgets/payment_widget.dart';
import 'package:islamic_marriage/screens/subscription_screens/widgets/payment_successful_widget.dart';
import 'package:islamic_marriage/screens/subscription_screens/widgets/summary_widget.dart';
import 'package:islamic_marriage/widgets/custom_appbar/custom_appbar.dart';
import 'package:islamic_marriage/widgets/custom_elevated_button.dart';

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
                  FreePlanWidget(),
                  ChoosePlanWidget(),
                  SummaryWidget(),
                  PaymentWidget(),
                  PaymentSuccessfulWidget(),
                  MyPurchasePlanWidget()
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
