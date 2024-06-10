import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage/screens/profile_update_screen/controller/change_password_controller.dart';
import 'package:islamic_marriage/screens/profile_update_screen/controller/profile_update_controller.dart';
import 'package:islamic_marriage/screens/profile_update_screen/models/change_password.dart';
import 'package:islamic_marriage/screens/profile_update_screen/models/profile_update.dart';
import 'package:islamic_marriage/services/shared_preference_service.dart';
import 'package:islamic_marriage/utils/app_colors.dart';
import 'package:islamic_marriage/utils/app_text_styles.dart';
import 'package:islamic_marriage/utils/app_urls.dart';
import 'package:islamic_marriage/utils/app_validators.dart';
import 'package:islamic_marriage/widgets/custom_appbar/custom_appbar.dart';
import 'package:islamic_marriage/widgets/custom_bottom_sheet.dart';
import 'package:islamic_marriage/widgets/custom_elevated_button.dart';
import 'package:islamic_marriage/widgets/custom_gender_selection.dart';
import 'package:islamic_marriage/widgets/custom_text_form_field.dart';
import 'package:islamic_marriage/utils/app_constant_functions.dart';

class ProfileUpdateScreen extends StatefulWidget {
  ProfileUpdateScreen({super.key});

  @override
  State<ProfileUpdateScreen> createState() => _ProfileUpdateScreenState();
}

class _ProfileUpdateScreenState extends State<ProfileUpdateScreen> {
  final _nameController = TextEditingController();

  final _phoneController = TextEditingController();

  final _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController.text = SharedPreferencesService().getUserName();
    _phoneController.text = SharedPreferencesService().getUserMobileNumber();
    _emailController.text = SharedPreferencesService().getUserEmail();
  }

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
                  readOnly: true),
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
              GetBuilder<ProfileUpdateController>(
                  builder: (controller) => controller.isLoading
                      ? customCircularProgressIndicator
                      : CustomElevatedButton(
                          onPressed: () {
                            _submitProfile(controller);
                          },
                          buttonName: 'Update'))
            ],
          ),
        ),
      ),
    );
  }

  final _oldPasswordController = TextEditingController();

  final _newPasswordController = TextEditingController();

  //final _confirmPasswordController = TextEditingController();

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
      // Gap(16.h),
      // CustomTextFormField(
      //     hintText: 'Confirm Password',
      //     controller: _confirmPasswordController,
      //     validator: (value) =>
      //         confirmPasswordValidator(value, _newPasswordController)),
      Gap(32.h),
      GetBuilder<ChangePasswordController>(
          builder: (controller) => controller.isLoading
              ? customCircularProgressIndicator
              : CustomElevatedButton(
                  onPressed: () {
                    _submitChangePassword(controller);
                  },
                  buttonName: 'Confirm')),
      Gap(32.h)
    ]));
  }

  void _clearData(){
    _oldPasswordController.clear();
    _newPasswordController.clear();
  }
  void _submitChangePassword(ChangePasswordController controller) async {
    final result = await controller.changingPassword(
        changePassword: ChangePassword(
            oldPassword: _oldPasswordController.text,
            newPassword: _newPasswordController.text));
    if (result) {
      _clearData();
      Navigator.pop(context);
    }
  }

  void _submitProfile(ProfileUpdateController controller) async {
    final result = await controller.updateProfile(
        profileUpdate: ProfileUpdate(fullName: _nameController.text));
    if (result) {
      Navigator.pop(context);
    }
  }
}
