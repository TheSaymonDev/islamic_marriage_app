import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage/routes/app_routes.dart';
import 'package:islamic_marriage/screens/explore_screens/controllers/all_user_controller.dart';
import 'package:islamic_marriage/screens/home_screen/controllers/bottom_nav_controller.dart';
import 'package:islamic_marriage/screens/wishlist_screen/controllers/wishlist_controller.dart';
import 'package:islamic_marriage/services/shared_preference_service.dart';
import 'package:islamic_marriage/utils/app_colors.dart';
import 'package:islamic_marriage/utils/app_constant_functions.dart';
import 'package:islamic_marriage/utils/app_urls.dart';
import 'package:islamic_marriage/widgets/custom_card.dart';
import 'package:islamic_marriage/widgets/custom_elevated_button.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {

  late String _name;

  @override
  void initState() {
    super.initState();
    _name = SharedPreferencesService().getUserName();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity.h,
      width: double.infinity.w,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: GetBuilder<AllUserController>(builder: (allUserController) {
        return GetBuilder<WishListController>(builder: (wishListController) {
          if (allUserController.isLoading || wishListController.isLoading) {
            // Show a loader when either controller is loading
            return Center(child: customCircularProgressIndicator);
          }
          if (allUserController.allUser == null ||
              allUserController.allUser!.data!.isEmpty) {
            // Show a message if no users are found
            return Center(child: Text('No users found.'));
          }

          return SizedBox(
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
                          text: 'welcome'.tr,
                          style: Theme.of(context).textTheme.bodyMedium,
                          children: [
                            TextSpan(
                              text: _name.toUpperCase(),
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.find<BottomNavController>().changeScreen(1);
                        },
                        child: SvgPicture.asset(AppUrls.filterSvg,
                            height: 20.h, width: 20.w),
                      ),
                    ],
                  ),
                  Gap(4.h),
                  Text("letsFindTitle".tr,
                      style: Theme.of(context).textTheme.bodySmall),
                  Gap(8.h),
                  Flexible(
                    child: ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final user = allUserController.allUser!.data![index];
                        return CustomCard(
                          height: 220.h,
                          border:
                          Border.all(color: AppColors.violetClr, width: 1.w),
                          padding: EdgeInsets.only(bottom: 4.h),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed(
                                    AppRoutes.bioDataDetailsScreen,
                                    arguments: {'user': user},
                                  );
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: 190.w,
                                              child: FittedBox(
                                                fit: BoxFit.scaleDown, // Scales the text down to fit within the space
                                                alignment: Alignment.centerLeft, // Align text to the left
                                                child: Text(
                                                  (user.contactInfo?.groomName ?? '').toUpperCase(),
                                                  style: Theme.of(context).textTheme.titleMedium,
                                                ),
                                              ),
                                            ),
                                            Gap(4.w),
                                            Icon(Icons.verified_outlined,
                                                size: 15.sp,
                                                color: AppColors.violetClr),
                                          ],
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(right: 16.w),
                                          child: GestureDetector(
                                            onTap: () {
                                              if (wishListController
                                                  .isInWishlist(user.id!)) {
                                                wishListController
                                                    .removeFromWishlist(user.id!);
                                              } else {
                                                wishListController
                                                    .addToWishlist(user.id!);
                                              }
                                            },
                                            child: Icon(
                                              wishListController
                                                  .isInWishlist(user.id!)
                                                  ? Icons.favorite
                                                  : Icons.favorite_border,
                                              size: 24.sp,
                                              color: Colors.red,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                        user.personalInfo != null
                                            ? '25 years 5 months, ${(user.generalInfo?.height ?? '').toUpperCase()}'
                                            : '',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(color: greyClr)),
                                    Text(
                                        (user.permanentAddress?.division ?? '')
                                            .toUpperCase(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(color: greyClr)),
                                    Text(
                                        (user.educationInfo?.highestEducation ??
                                            '')
                                            .toUpperCase(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(color: greyClr)),
                                    Text(
                                        (user.occupationInfo?.occupation ?? '')
                                            .toUpperCase(),
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
                                                .copyWith(color: Colors.green)),
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
                      itemCount: allUserController.allUser!.data!.length,
                    ),
                  ),
                  Gap(8.h),
                ],
              ),
            ),
          );
        });
      }),
    );
  }
}
