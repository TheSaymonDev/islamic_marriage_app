import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage/routes/app_routes.dart';
import 'package:islamic_marriage/utils/app_colors.dart';
import 'package:islamic_marriage/utils/app_text_styles.dart';
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
                      Text(AppUrls.hadith,
                          style: AppTextStyles.bodyMedium(
                              color: AppColors.purpleClr),
                          textAlign: TextAlign.center)
                    ],
                  );
                },
                options: CarouselOptions(
                    onPageChanged: (index, reason) {
                      _currentIndex = index;
                      setState(() {});
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
                  activeDotColor: AppColors.purpleClr,
                  dotColor: Colors.grey),
              onDotClicked: (index) {
                _currentIndex = index;
                setState(() {});
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
                    buttonName: 'Get Start')),
            Gap(48.h)
          ],
        ),
      ),
    );
  }
}
