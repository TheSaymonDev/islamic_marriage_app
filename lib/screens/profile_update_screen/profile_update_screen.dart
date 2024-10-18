import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage/screens/profile_update_screen/controllers/change_password_controller.dart';
import 'package:islamic_marriage/screens/profile_update_screen/controllers/profile_update_controller.dart';
import 'package:islamic_marriage/screens/profile_update_screen/models/change_password.dart';
import 'package:islamic_marriage/screens/profile_update_screen/models/profile_update.dart';
import 'package:islamic_marriage/utils/app_colors.dart';
import 'package:islamic_marriage/utils/app_constant_functions.dart';
import 'package:islamic_marriage/utils/app_validators.dart';
import 'package:islamic_marriage/widgets/custom_appbar/custom_appbar.dart';
import 'package:islamic_marriage/widgets/custom_bottom_sheet.dart';
import 'package:islamic_marriage/widgets/custom_elevated_button.dart';
import 'package:islamic_marriage/widgets/custom_gender_selection.dart';
import 'package:islamic_marriage/widgets/custom_text_form_field.dart';

class ProfileUpdateScreen extends StatefulWidget {
  ProfileUpdateScreen({super.key});

  @override
  State<ProfileUpdateScreen> createState() => _ProfileUpdateScreenState();
}

class _ProfileUpdateScreenState extends State<ProfileUpdateScreen> {
  final _formKey = GlobalKey<FormState>();
  final _oldPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        onPressedBack: () {
          Get.back();
        },
        title: 'profileUpdateAppbarTitle'.tr,
      ),
      body: Container(
        height: double.infinity.h,
        width: double.infinity.w,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: GetBuilder<ProfileUpdateController>(
          builder: (controller) => controller.isLoading
              ? Center(child: customCircularProgressIndicator)
              : SingleChildScrollView(
                  child: Form(
                    key: _formKey, // Assign the form key here
                    child: Column(
                      children: [
                        Gap(128.h),
                        CustomGenderSelection(
                          genders: controller.gender,
                          currentGender: controller.currentGender,
                          onGenderSelected: (index) =>
                              controller.selectGender(index),
                        ),
                        Gap(16.h),
                        CustomTextFormField(
                          validator: nameValidator,
                          hintText: 'nameHint'.tr,
                          controller: controller.nameController,
                        ),
                        Gap(16.h),
                        CustomTextFormField(
                          hintText: 'phoneHint'.tr,
                          controller: controller.phoneController,
                          keyBoardType: TextInputType.phone,
                          readOnly: true,
                        ),
                        Gap(16.h),
                        CustomTextFormField(
                          hintText: 'emailHint'.tr,
                          controller: controller.emailController,
                          readOnly: true,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              _showBottomSheet();
                            },
                            child: Text(
                              'changePassword'.tr,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(color: violetClr),
                            ),
                          ),
                        ),
                        Gap(24.h),
                        CustomElevatedButton(
                          onPressed: () {
                            _submitProfile(controller);
                          },
                          buttonName: 'updateProfile'.tr,
                        ),
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }

  Future<dynamic> _showBottomSheet() {
    return Get.bottomSheet(CustomBottomSheet(children: [
      Text('changePass'.tr, style: Theme.of(context).textTheme.titleMedium),
      Gap(32.h),
      CustomTextFormField(
          hintText: 'oldPass'.tr,
          controller: _oldPasswordController,
          validator: passwordValidator),
      Gap(16.h),
      CustomTextFormField(
          hintText: 'setPasswordNewPassHint'.tr,
          controller: _newPasswordController,
          validator: passwordValidator),
      Gap(32.h),
      GetBuilder<ChangePasswordController>(
          builder: (controller) => controller.isLoading
              ? customCircularProgressIndicator
              : CustomElevatedButton(
                  onPressed: () {
                    _submitChangePassword(controller);
                  },
                  buttonName: 'confirm'.tr)),
      Gap(32.h)
    ]));
  }

  void _clearData() {
    _oldPasswordController.clear();
    _newPasswordController.clear();
  }

  void _submitChangePassword(ChangePasswordController controller) async {
    final result = await controller.changingPassword(
        changePassword: ChangePassword(
            oldPassword: _oldPasswordController.text,
            newPassword: _newPasswordController.text));
    if (result) {
      Navigator.pop(context);
      _clearData();
    }
  }

  void _submitProfile(ProfileUpdateController controller) async {
    // Ensure that the form is valid before submitting
    if (_formKey.currentState?.validate() ?? false) {
      // Call the updateProfile method from the controller
      final result = await controller.updateProfile(
        profileUpdate: ProfileUpdate(
          name: controller.nameController.text,
          gender: controller.gender[controller.currentGender].value,
        ),
      );

      if (result) {
        // If the update is successful, refresh the profile info
        controller.getProfileInfo();
      }
    }
  }
}
