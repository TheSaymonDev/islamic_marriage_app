import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage/screens/home_screen/home_screen.dart';
import 'package:islamic_marriage/screens/plan_screen/widgets/choose_plan_widget.dart';
import 'package:islamic_marriage/screens/plan_screen/widgets/free_plan_widget.dart';
import 'package:islamic_marriage/screens/plan_screen/widgets/my_purchase_plan_widget.dart';
import 'package:islamic_marriage/screens/plan_screen/widgets/payment_successful_widget.dart';
import 'package:islamic_marriage/screens/plan_screen/widgets/payment_widget.dart';
import 'package:islamic_marriage/screens/plan_screen/widgets/summary_widget.dart';
import 'package:islamic_marriage/widgets/custom_elevated_button.dart';

class PlanScreen extends StatefulWidget {
  const PlanScreen({super.key});

  @override
  State<PlanScreen> createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
  final _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity.h,
      width: double.infinity.w,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          Expanded(
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _pageController,
              onPageChanged: (newValue) {
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
          CustomElevatedButton(
              onPressed: () {
                if (_currentPage == 5) {
                  Get.to(() =>  HomeScreen());
                } else {
                  _pageController.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut);
                }
              },
              buttonName: _currentPage == 0
                  ? 'Upgrade Plan'
                  : _currentPage == 3
                      ? 'Pay'
                      : 'Continue'),
          Gap(32.h),
        ],
      ),
    );
  }
}
