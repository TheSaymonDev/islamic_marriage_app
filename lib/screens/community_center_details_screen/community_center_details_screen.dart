import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage/screens/booking_screen/booking_screen.dart';
import 'package:islamic_marriage/screens/kazi_office_details_screen/model/kazi_office_review_model.dart';
import 'package:islamic_marriage/screens/review_screen/review_screen.dart';
import 'package:islamic_marriage/utils/app_colors.dart';
import 'package:islamic_marriage/utils/app_text_styles.dart';
import 'package:islamic_marriage/utils/app_urls.dart';
import 'package:islamic_marriage/widgets/custom_appbar/custom_appbar.dart';
import 'package:islamic_marriage/widgets/custom_elevated_button.dart';


class CommunityCenterDetailsScreen extends StatefulWidget {
  final String des;
  const CommunityCenterDetailsScreen({super.key, required this.des});

  @override
  State<CommunityCenterDetailsScreen> createState() => _CommunityCenterDetailsScreenState();
}

class _CommunityCenterDetailsScreenState extends State<CommunityCenterDetailsScreen> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        onPressedBack: () {
          Get.back();
        },
        title: 'Kazi Office',
      ),
      body: Container(
        height: double.infinity.h,
        width: double.infinity.w,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Gap(16.h),
              Text(
                'Pakistani and Indian Muslim Marriage Bureau',
                style: AppTextStyles.titleMedium()
              ),
              Gap(16.h),
              Container(
                height: 390.h,
                width: double.infinity.w,
                alignment: Alignment.topRight,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    image: DecorationImage(
                        image: AssetImage(AppUrls.demoPng),
                        fit: BoxFit.fill)),
                child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.favorite,
                      color: Colors.red,
                      size: 30.sp,
                    )),
              ),
              Gap(8.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'About',
                    style: AppTextStyles.titleMedium()
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 20.sp,
                      ),
                      Text(
                        '3.9',
                        style: AppTextStyles.titleMedium()
                      ),
                    ],
                  ),
                ],
              ),
              Gap(8.h),
              Text(
                _isExpanded == true
                    ? widget.des.substring(0, widget.des.length)
                    : widget.des.substring(0, 100),
                style: AppTextStyles.bodyMedium()
              ),
              Gap(8.h),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _isExpanded = !_isExpanded;
                  });
                },
                child: Text(
                  _isExpanded ? 'Read Less' : 'Read More',
                  style: AppTextStyles.titleMedium()
                ),
              ),
              Gap(16.h),
              Container(
                height: 76.h,
                width: double.infinity.w,
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r), color: const Color(0xFFE6E6E6)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 55.h,
                        width: 146.w,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(color: AppColors.violetClr, width: 1.w),
                            color: AppColors.filledClr),
                        child: Text(
                          '${AppUrls.takaSign}70',
                          style: AppTextStyles.bodyMedium()
                        ),
                      ),
                    ),
                    CustomElevatedButton(
                      onPressed: () {
                        Get.to(()=>const BookingScreen());
                      },
                      buttonName: 'Book Now',
                      buttonWidth: 146.w,
                    ),
                  ],
                ),
              ),
              Gap(16.h),
              Text(
                'Reviews',
                style: AppTextStyles.titleLarge()
              ),
              Gap(4.h),
              GestureDetector(
                onTap: (){
                  Get.to(()=>const ReviewScreen());
                },
                child: Text(
                  'Write your review',
                  style: AppTextStyles.bodyMedium(color: AppColors.greyColor),
                ),
              ),
              Gap(32.h),
              Flexible(
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final review = KaziOfficeReviewModel.reviewList[index];
                    return Container(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      width: double.infinity,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 46.h,
                            width: 46.w,
                            child: CircleAvatar(
                              backgroundImage:
                              AssetImage(review.profileImage),
                            ),
                          ),
                          Gap(26.w),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      review.name,
                                      style: AppTextStyles.titleMedium()
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          size: 25.sp,
                                          color: Colors.yellow,
                                        ),
                                        Text(
                                          review.rating.toString(),
                                          style: AppTextStyles.bodyMedium()
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                Gap(8.h),
                                Text(
                                  review.message,
                                  style: AppTextStyles.bodySmall()
                                ),
                                Gap(8.h),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Row(
                                        children: List.generate(
                                            review
                                                .productImage.length,
                                                (index) => Container(
                                              height: 58.h,
                                              width: 58.w,
                                              margin: EdgeInsets.only(
                                                  right: 10.w),
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                          review
                                                              .productImage[
                                                          index]),
                                                      fit: BoxFit
                                                          .cover)),
                                            )),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Helpful',
                                          style: AppTextStyles.bodyMedium()
                                        ),
                                        Gap(4.w),
                                        InkWell(
                                          onTap: () {
                                            review.toggleHelpful();
                                            setState(() {});
                                          },
                                          child: SizedBox(
                                            height: 20.h,
                                            width: 22.w,
                                            child: SvgPicture.asset(
                                              AppUrls.likeSvg,
                                              fit: BoxFit.cover,
                                              colorFilter:
                                              review.isLiked ==
                                                  true
                                                  ? const ColorFilter.mode(
                                                  AppColors.greyColor,
                                                  BlendMode.srcIn)
                                                  : null,
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => Gap(20.h),
                  itemCount: KaziOfficeReviewModel.reviewList.length,
                ),
              ),
              Gap(16.h),
            ],
          ),
        ),
      ),
    );
  }
}
