import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage/screens/bio_data_details_screen/bio_data_details_screen.dart';
import 'package:islamic_marriage/screens/explore_screens/controller/all_user_controller.dart';
import 'package:islamic_marriage/services/shared_preference_service.dart';
import 'package:islamic_marriage/utils/app_colors.dart';
import 'package:islamic_marriage/utils/app_constant_functions.dart';
import 'package:islamic_marriage/utils/app_urls.dart';
import 'package:islamic_marriage/widgets/custom_card.dart';
import 'package:islamic_marriage/widgets/custom_elevated_button.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  late String _name;
  List<bool> _isFavoriteList = [];

  @override
  void initState() {
    super.initState();
    _name = SharedPreferencesService().getUserName();
  }

  void _toggleFavorite(int index) {
    setState(() {
      _isFavoriteList[index] = !_isFavoriteList[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AllUserController>(builder: (controller) {
      // Ensure allUser and its data are not null before accessing them
      final users = controller.allUser?.data ?? [];

      if (_isFavoriteList.length != users.length) {
        _isFavoriteList = List.filled(users.length, false);
      }

      return controller.isLoading
          ? Center(child: customCircularProgressIndicator) // Show loader
          : SizedBox(
              height: double.infinity.h,
              width: double.infinity.w,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Gap(16.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                            text: TextSpan(
                                text: 'Welcome! ',
                                style: Theme.of(context).textTheme.bodyMedium,
                                children: [
                              TextSpan(
                                  text: _name.toUpperCase(),
                                  style:
                                      Theme.of(context).textTheme.titleMedium)
                            ])),
                        GestureDetector(
                          onTap: () {},
                          child: SvgPicture.asset(AppUrls.filterSvg,
                              height: 20.h, width: 20.w),
                        )
                      ],
                    ),
                    Gap(4.h),
                    Text("Let's find your soulmate",
                        style: Theme.of(context).textTheme.bodySmall),
                    Gap(8.h),
                    Flexible(
                      child: ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final user = users[index];
                          return CustomCard(
                            height: 220.h,
                            border: Border.all(
                                color: AppColors.violetClr, width: 1.w),
                            padding: EdgeInsets.only(bottom: 4.h),
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                     Get.to(() => BioDataDetailsScreen(user: user));
                                  },
                                  child: SizedBox(
                                    height: 130.h,
                                    width: 130.w,
                                    child: CircleAvatar(
                                      foregroundImage:
                                          AssetImage(AppUrls.placeHolderPng),
                                    ),
                                  ),
                                ),
                                Gap(4.w),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  Get.to(() => BioDataDetailsScreen(user: user));
                                                },
                                                child: Text(
                                                    (user.contactInfo?.groomName ?? 'N/A').toUpperCase(),
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .titleMedium),
                                              ),
                                              Gap(4.w),
                                              Icon(Icons.verified_outlined,
                                                  size: 15.sp,
                                                  color: AppColors.violetClr),
                                            ],
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.only(right: 16.w),
                                            child: GestureDetector(
                                              onTap: () =>
                                                  _toggleFavorite(index),
                                              child: Icon(
                                                  _isFavoriteList[index]
                                                      ? Icons.favorite
                                                      : Icons.favorite_outline,
                                                  size: 25.sp,
                                                  color: Colors.red),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                          user.personalInfo != null
                                              ? '25 years 5 months, ${ (user.generalInfo?.height ?? 'N/A').toUpperCase()}'
                                              : 'N/A',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall!
                                              .copyWith(color: greyClr)),
                                      Text(

                                          (user.permanentAddress?.division ?? 'N/A').toUpperCase(),

                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(color: greyClr)),
                                      Text(
                                          (user.educationInfo?.highestEducation ?? 'N/A').toUpperCase(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(color: greyClr)),
                                      Text(
                                          (user.occupationInfo?.occupation ?? 'N/A').toUpperCase(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(color: greyClr)),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          CircleAvatar(
                                              backgroundColor: Colors.green,
                                              radius: 4.r),
                                          Gap(4.w),
                                          Text('Active Now',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium!
                                                  .copyWith(
                                                      color: Colors.green)),
                                        ],
                                      ),
                                      CustomElevatedButton(
                                          onPressed: () {
                                            customSuccessMessage(
                                                message: 'Invitation Sent');
                                          },
                                          buttonName: 'Send Invitation',
                                          buttonHeight: 30.h,
                                          buttonWidth: 130.w,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall!
                                              .copyWith(color: darkFontClr))
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => Gap(8.h),
                        itemCount: users.length,
                      ),
                    ),
                    Gap(8.h),
                  ],
                ),
              ),
            );
    });
  }
}
