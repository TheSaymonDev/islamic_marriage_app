import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:islamic_marriage/utils/app_colors.dart';
import 'package:islamic_marriage/utils/app_text_styles.dart';
import 'package:islamic_marriage/utils/app_urls.dart';
import 'package:islamic_marriage/widgets/common_widgets/custom_appbar/appbar_textview_with_back.dart';
import 'package:islamic_marriage/widgets/common_widgets/custom_bottom_sheet.dart';
import 'package:islamic_marriage/widgets/common_widgets/custom_elevated_button.dart';
import 'package:islamic_marriage/widgets/common_widgets/custom_text_form_field.dart';

class ProfileUpdatePage extends StatelessWidget {
  ProfileUpdatePage({super.key});

  final _nameController = TextEditingController();
  final _dateOfBirthController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        onPressedBack: () {
          Get.back();
        },
        title: 'Profile Update',
      ),
      body: Container(
        height: double.infinity.h,
        width: double.infinity.w,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Gap(32.h),
              Stack(
                children: [
                  SizedBox(
                    height: 110.h,
                    width: 110.w,
                    child: CircleAvatar(
                      foregroundImage: AssetImage(AppUrls.photoPng),
                    ),
                  ),
                  Positioned(
                    top: 5,
                    right: 5,
                    child: CircleAvatar(
                      backgroundColor: AppColors.violetClr,
                      radius: 15.r,
                      child: Icon(
                        Icons.camera_alt_outlined,
                        color: AppColors.whiteClr,
                        size: 15.sp,
                      ),
                    ),
                  )
                ],
              ),
              Gap(32.h),
              CustomTextFormField(hintText: 'Name', controller: _nameController),
              Gap(16.h),
              CustomTextFormField(
                hintText: 'Date of Birth',
                controller: _dateOfBirthController,
                suffixIcon: IconButton(
                    onPressed: () async{
                      DateTime? selectedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2001),
                        lastDate: DateTime(2024, 12, 31),
                      );
                      if (selectedDate != null) {
                        // Update your controller with the selected date
                        _dateOfBirthController.text =
                            DateFormat('dd/MM/yyyy').format(selectedDate);
                      }
                    },
                    icon: Icon(
                      Icons.calendar_today,
                      size: 20.sp,
                      color: AppColors.violetClr,
                    )),
                readOnly: true,
              ),
              Gap(16.h),
              CustomTextFormField(
                  hintText: 'Phone', controller: _phoneController, keyBoardType: TextInputType.phone,),
              Gap(16.h),
              CustomTextFormField(
                  hintText: 'Password', controller: _passwordController, readOnly: true,),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    _showBottomSheet();
                  },
                  child: Text(
                    'Change Password',
                    style: AppTextStyles.titleMedium(color: AppColors.violetClr),
                  ),
                ),
              ),
              Gap(24.h),
              CustomElevatedButton(onPressed: () {}, buttonName: 'Update')
            ],
          ),
        ),
      ),
    );
  }

  final _oldPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  Future<dynamic> _showBottomSheet() {
    return Get.bottomSheet(CustomBottomSheet(children: [
      Text(
        'Change Password',
        style: AppTextStyles.titleMedium()
      ),
      Gap(32.h),
      CustomTextFormField(
          hintText: 'Old Password', controller: _oldPasswordController),
      Gap(16.h),
      CustomTextFormField(
          hintText: 'New Password', controller: _newPasswordController),
      Gap(16.h),
      CustomTextFormField(
          hintText: 'Confirm Password', controller: _confirmPasswordController),
      Gap(32.h),
      CustomElevatedButton(onPressed: () {}, buttonName: 'Confirm'),
      Gap(32.h)
    ]));
  }
}
