import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage/screens/profile_update_screen/controller/change_password_controller.dart';
import 'package:islamic_marriage/screens/profile_update_screen/controller/profile_update_controller.dart';
import 'package:islamic_marriage/screens/profile_update_screen/model/change_password.dart';
import 'package:islamic_marriage/utils/app_colors.dart';
import 'package:islamic_marriage/utils/app_text_styles.dart';
import 'package:islamic_marriage/utils/app_urls.dart';
import 'package:islamic_marriage/utils/validator.dart';
import 'package:islamic_marriage/widgets/common_widgets/custom_appbar/appbar_textview_with_back.dart';
import 'package:islamic_marriage/widgets/common_widgets/custom_bottom_sheet.dart';
import 'package:islamic_marriage/widgets/common_widgets/custom_elevated_button.dart';
import 'package:islamic_marriage/widgets/common_widgets/custom_gender_selection.dart';
import 'package:islamic_marriage/widgets/common_widgets/custom_text_form_field.dart';
import 'package:islamic_marriage/widgets/styles.dart';

class ProfileUpdateScreen extends StatelessWidget {
  ProfileUpdateScreen({super.key});

  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();

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
              Gap(64.h),
              GetBuilder<ProfileUpdateController>(builder: (controller) {
                return GestureDetector(
                  onTap: () {
                    controller.getImageFromGallery();
                  },
                  child: Stack(
                    children: [
                      SizedBox(
                        height: 110.h,
                        width: 110.w,
                        child: CircleAvatar(
                          foregroundImage: controller.imageFile == null
                              ? AssetImage(AppUrls.placeHolderPng)
                              : FileImage(controller.imageFile!)
                                  as ImageProvider,
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
                );
              }),
              Gap(32.h),
              GetBuilder<ProfileUpdateController>(builder: (controller) {
                return CustomGenderSelection(
                  genders: controller.gender,
                  currentGender: controller.currentGender,
                  onGenderSelected: (index) => controller.selectGender(index),
                );
              }),
              Gap(16.h),
              CustomTextFormField(
                  hintText: 'Name', controller: _nameController),
              Gap(16.h),
              CustomTextFormField(
                hintText: 'Phone',
                controller: _phoneController,
                keyBoardType: TextInputType.phone,
              ),
              Gap(16.h),
              CustomTextFormField(
                hintText: 'Email',
                controller: _emailController,
                readOnly: true,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    _showBottomSheet();
                  },
                  child: Text(
                    'Change Password?',
                    style:
                        AppTextStyles.titleMedium(color: AppColors.violetClr),
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
      Text('Change Password', style: AppTextStyles.titleMedium()),
      Gap(32.h),
      CustomTextFormField(
          hintText: 'Old Password',
          controller: _oldPasswordController,
          validator: passwordValidator),
      Gap(16.h),
      CustomTextFormField(
          hintText: 'New Password',
          controller: _newPasswordController,
          validator: passwordValidator),
      Gap(16.h),
      CustomTextFormField(
          hintText: 'Confirm Password',
          controller: _confirmPasswordController,
          validator: (value) =>
              confirmPasswordValidator(value, _newPasswordController)),
      Gap(32.h),
      GetBuilder<ChangePasswordController>(
          builder: (controller) => controller.isLoading
              ? customCircularProgressIndicator
              : CustomElevatedButton(
                  onPressed: () {
                    _formOnSubmit(controller);
                  },
                  buttonName: 'Confirm')),
      Gap(32.h)
    ]));
  }

  void _formOnSubmit(ChangePasswordController controller) async {
    final result = await controller.changingPassword(
        changePassword: ChangePassword(
            oldPassword: _oldPasswordController.text,
            newPassword: _newPasswordController.text));
    if (result) {
      Get.back();
    }
  }
}
