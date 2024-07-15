import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart' hide CarouselController;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage/routes/app_routes.dart';
import 'package:islamic_marriage/utils/app_colors.dart';
import 'package:islamic_marriage/utils/app_urls.dart';
import 'package:islamic_marriage/widgets/custom_elevated_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity.h,
        width: double.infinity.w,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            const Spacer(),
            CarouselSlider.builder(
                itemCount: 3,
                itemBuilder:
                    (BuildContext context, int itemIndex, int pageViewIndex) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                          height: 270.h,
                          width: 300.w,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(AppUrls.appLogoPng),
                                  fit: BoxFit.fill))),
                      Gap(32.h),
                      Text('onboardingMsg'.tr,
                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: purpleClr),
                          textAlign: TextAlign.center)
                    ],
                  );
                },
                options: CarouselOptions(
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                    initialPage: 0,
                    height: 550.h,
                    autoPlay: true,
                    viewportFraction: 1)),
            Gap(30.h),
            SmoothPageIndicator(
              controller: PageController(initialPage: _currentIndex),
              count: 3,
              effect: ExpandingDotsEffect(
                  dotHeight: 8.0.h,
                  dotWidth: 16.0.w,
                  activeDotColor: purpleClr,
                  dotColor: greyClr),
              onDotClicked: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
            const Spacer(),
            Gap(100.h),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: CustomElevatedButton(
                    onPressed: () {
                      Get.toNamed(AppRoutes.signInScreen);
                    },
                    buttonName: 'getStart'.tr)),
            Gap(48.h)
          ],
        ),
      ),
    );
  }
}
