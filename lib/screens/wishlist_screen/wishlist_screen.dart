import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage/routes/app_routes.dart';
import 'package:islamic_marriage/screens/wishlist_screen/controllers/wishlist_controller.dart';
import 'package:islamic_marriage/utils/app_colors.dart';
import 'package:islamic_marriage/utils/app_constant_functions.dart';
import 'package:islamic_marriage/utils/app_urls.dart';
import 'package:islamic_marriage/widgets/custom_appbar/custom_appbar.dart';
import 'package:islamic_marriage/widgets/custom_card.dart';
import 'package:islamic_marriage/widgets/custom_elevated_button.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
          onPressedBack: () {
            Get.back();
          },
          title: 'wishlistAppbarTitle'.tr),
      body: Container(
        height: double.infinity.h,
        width: double.infinity.w,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: GetBuilder<WishListController>(
            builder: (controller) {
              if (controller.isLoading) {
                return customCircularProgressIndicator;
              } else if (controller.wishListItems == null ||
                  controller.wishListItems!.favouriteLists!.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.favorite_border, size: 80.sp, color: greyClr),
                      Gap(16.h),
                      Text(
                        'No items in your wishlist',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                );
              } else {
                return _buildWishlistItem(controller);
              }
            }),
      ),
    );
  }

  ListView _buildWishlistItem(WishListController controller) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final user = controller.wishListItems!.favouriteLists![index];
        return CustomCard(
          height: 220.h,
          border: Border.all(color: violetClr, width: 1.w),
          padding: EdgeInsets.only(bottom: 4.h),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Get.toNamed(
                    AppRoutes.favouriteBioDataDetailsScreen,
                    arguments: {'user': user},
                  );
                },
                child: SizedBox(
                  height: 130.h,
                  width: 130.w,
                  child: CircleAvatar(
                    foregroundImage: AssetImage(AppUrls.placeHolderPng),
                  ),
                ),
              ),
              Gap(4.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                                (user.contactInfo?.groomName ?? 'N/A')
                                    .toUpperCase(),
                                style: Theme.of(context).textTheme.titleMedium),
                            Gap(4.w),
                            Icon(Icons.verified_outlined,
                                size: 15.sp, color: AppColors.violetClr),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 16.w),
                          child: GetBuilder<WishListController>(
                              builder: (wishListController) {
                                return GestureDetector(
                                  onTap: () {
                                    if (wishListController.isInWishlist(user.id!)) {
                                      wishListController
                                          .removeFromWishlist(user.id!);
                                    } else {
                                      wishListController.addToWishlist(user.id!);
                                    }
                                  },
                                  child: Icon(
                                    wishListController.isInWishlist(user.id!)
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    size: 24.sp,
                                    color: Colors.red,
                                  ),
                                );
                              }),
                        ),
                      ],
                    ),
                    Text(
                        user.personalInfo != null
                            ? '25 years 5 months, ${(user.generalInfo?.height ?? 'N/A').toUpperCase()}'
                            : 'N/A',
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: greyClr)),
                    Text(
                        (user.permanentAddress?.division ?? 'N/A')
                            .toUpperCase(),
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: greyClr)),
                    Text(
                        (user.educationInfo?.highestEducation ?? 'N/A')
                            .toUpperCase(),
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: greyClr)),
                    Text(
                        (user.occupationInfo?.occupation ?? 'N/A')
                            .toUpperCase(),
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: greyClr)),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                            backgroundColor: Colors.green, radius: 4.r),
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
                          customSuccessMessage(message: 'Invitation Sent');
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
      itemCount: controller.wishListItems!.favouriteLists!.length,
    );
  }
}
