import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage/screens/address_management_screen/address_management_screen.dart';
import 'package:islamic_marriage/screens/address_view_screen/widgets/address_management_button.dart';
import 'package:islamic_marriage/utils/app_colors.dart';
import 'package:islamic_marriage/utils/app_text_styles.dart';
import 'package:islamic_marriage/utils/app_constant_functions.dart';
import 'package:islamic_marriage/widgets/custom_appbar/custom_appbar.dart';
import 'package:islamic_marriage/widgets/custom_elevated_button.dart';

class AddressViewScreen extends StatefulWidget {
  const AddressViewScreen({super.key});

  @override
  State<AddressViewScreen> createState() => _AddressViewScreenState();
}

class _AddressViewScreenState extends State<AddressViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
          onPressedBack: () {
            Get.back();
          },
          title: 'Shipping Address'),
      body: Container(
        height: double.infinity.h,
        width: double.infinity.w,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(children: [
          Gap(32.h),
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: double.infinity.w,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Md. Saymon',
                                    style: AppTextStyles.titleMedium()),
                                Text('01643831739',
                                    style: AppTextStyles.titleMedium(
                                        color: AppColors.greyColor))
                              ]),
                          Gap(8.h),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                    child: Text(
                                        'Bhani, Dharoga Bari, 3571\nDevidwar, Cumilla, Chittagong',
                                        style: AppTextStyles.bodyMedium())),
                                AddressManagementButton(
                                    isEditable: true,
                                    onTap: () {
                                      Get.to(() => AddressManagementScreen(
                                          title: 'Update'));
                                    })
                              ]),
                          Gap(8.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 16.w, vertical: 8.h),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4.r),
                                      color:
                                          AppColors.violetClr.withOpacity(0.3)),
                                  child: Text('Default Address',
                                      style: AppTextStyles.titleSmall())),
                              AddressManagementButton(
                                isEditable: false,
                                onTap: () {
                                  showDialogBox(
                                    title: 'Remove',
                                    middleText: 'Are you sure want to remove?',
                                    onPressedCancel: () {
                                      Get.back();
                                    },
                                    onPressedConfirm: () {
                                      Get.back();
                                    },
                                  );
                                },
                              )
                            ],
                          ),
                          Divider(
                              color: AppColors.violetClr.withOpacity(0.3),
                              thickness: 1.h)
                        ]),
                  );
                },
                separatorBuilder: (context, index) => Gap(48.h),
                itemCount: 2),
          ),
          Gap(40.h),
          CustomElevatedButton(
              onPressed: () {
                Get.to(() => const AddressManagementScreen(title: 'Add'));
              },
              buttonName: 'Add New Address'),
          Gap(32.h)
        ]),
      ),
    );
  }
}
