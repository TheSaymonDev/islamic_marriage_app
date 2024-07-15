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
import 'package:islamic_marriage/widgets/custom_profile_avatar.dart';
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
  final _formKey = GlobalKey<FormState>();

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
        title: 'profileUpdate'.tr,
      ),
      body: Container(
        height: double.infinity.h,
        width: double.infinity.w,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Gap(64.h),
                GetBuilder<ProfileUpdateController>(
                  builder: (controller) {
                    return CustomProfileAvatar(
                      foregroundImage: controller.imageFile == null
                          ? AssetImage(AppUrls.placeHolderPng)
                          : FileImage(controller.imageFile!) as ImageProvider,
                      iconData: Icons.camera_alt_outlined,
                      onTap: () {
                        controller.getImageFromGallery();
                      },
                    );
                  },
                ),
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
                    hintText: 'nameHint'.tr, controller: _nameController),
                Gap(16.h),
                CustomTextFormField(
                    hintText: 'phoneHint'.tr,
                    controller: _phoneController,
                    keyBoardType: TextInputType.phone,
                    readOnly: true),
                Gap(16.h),
                CustomTextFormField(
                  hintText: 'emailHint'.tr,
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
                      'changePassword'.tr,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: violetClr),
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
                            buttonName: 'updateProfile'.tr))
              ],
            ),
          ),
        ),
      ),
    );
  }

  final _oldPasswordController = TextEditingController();

  final _newPasswordController = TextEditingController();

  Future<dynamic> _showBottomSheet() {
    return Get.bottomSheet(CustomBottomSheet(children: [
      Text('changePass'.tr, style: AppTextStyles.titleMedium()),
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
    if (_formKey.currentState?.validate() ?? false) {
      final result = await controller.updateProfile(
          profileUpdate: ProfileUpdate(
              name: _nameController.text,
              gender: controller.gender[controller.currentGender].value));
      if (result) {
        Navigator.pop(context);
      }
    }
  }
}
