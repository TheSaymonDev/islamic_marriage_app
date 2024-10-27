import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage/screens/profile_update_screen/controllers/change_pass_controller.dart';
import 'package:islamic_marriage/screens/profile_update_screen/controllers/profile_update_controller.dart';
import 'package:islamic_marriage/screens/profile_update_screen/models/change_pass_model.dart';
import 'package:islamic_marriage/screens/profile_update_screen/models/profile_update_model.dart';
import 'package:islamic_marriage/utils/app_colors.dart';
import 'package:islamic_marriage/utils/app_constant_functions.dart';
import 'package:islamic_marriage/utils/app_urls.dart';
import 'package:islamic_marriage/utils/app_validators.dart';
import 'package:islamic_marriage/widgets/custom_appbar/custom_appbar.dart';
import 'package:islamic_marriage/widgets/custom_bottom_sheet.dart';
import 'package:islamic_marriage/widgets/custom_elevated_button.dart';
import 'package:islamic_marriage/widgets/custom_profile_avatar.dart';
import 'package:islamic_marriage/widgets/custom_text_form_field.dart';

class ProfileUpdateScreen extends StatelessWidget {
  ProfileUpdateScreen({super.key});

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
                    key: controller.formKey, // Assign the form key here
                    child: Column(
                      children: [
                        Gap(100.h),
                        CustomProfileAvatar(
                          onTap: () {
                            controller.getImageFromGallery();
                          },
                          iconData: FontAwesomeIcons.camera,
                          foregroundImage: controller.imageFile != null
                              ? FileImage(controller.imageFile!)
                              : controller.imgUrl == null
                                  ? AssetImage(AppUrls.placeHolderPng)
                                  : NetworkImage(
                                          '${AppUrls.baseUrl}/${controller.imgUrl}')
                                      as ImageProvider,
                        ),
                        Gap(16.h),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                                controller.gender.length,
                                (index) => GestureDetector(
                                    onTap: () {
                                      controller.genderSelection(index);
                                      print(
                                          "User selected gender: ${controller.gender[index].value}");
                                    },
                                    child: Container(
                                        height: 40.h,
                                        width: 100.w,
                                        margin: EdgeInsets.only(right: 16.w),
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            color: AppColors.purple50Clr,
                                            borderRadius:
                                                BorderRadius.circular(4.r),
                                            border: Border.all(
                                                color:
                                                    controller.currentGender ==
                                                            index
                                                        ? purpleClr
                                                        : lightBgClr)),
                                        child: Text(
                                            controller.gender[index].title,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium))))),
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
                              _showBottomSheet(context);
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

  Future<dynamic> _showBottomSheet(BuildContext context) {
    return Get.bottomSheet(CustomBottomSheet(children: [
      Text('changePass'.tr, style: Theme.of(context).textTheme.titleMedium),
      Gap(32.h),
      GetBuilder<ChangePassController>(builder: (controller) {
        return CustomTextFormField(
            hintText: 'oldPass'.tr,
            controller: controller.oldPasswordController,
            validator: passwordValidator,
            obscureText: controller.isObscureOld,
            suffixIcon: IconButton(
                onPressed: () => controller.toggleObscureOld(),
                icon: Icon(
                    controller.isObscureOld
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: greyClr,
                    size: 25.sp)));
      }),
      Gap(16.h),
      GetBuilder<ChangePassController>(builder: (controller) {
        return CustomTextFormField(
          hintText: 'setPasswordNewPassHint'.tr,
          controller: controller.newPasswordController,
          obscureText: controller.isObscureNew,
          validator: passwordValidator,
          suffixIcon: IconButton(
              onPressed: () => controller.toggleObscureN(),
              icon: Icon(
                  controller.isObscureNew
                      ? Icons.visibility_off
                      : Icons.visibility,
                  color: greyClr,
                  size: 25.sp)),
        );
      }),
      Gap(16.h),
      GetBuilder<ChangePassController>(
        builder: (controller) {
          return CustomTextFormField(
              hintText: 'setPasswordConPassHint'.tr,
              controller:
              controller.confirmPasswordController,
              obscureText: controller.isObscureConfirm,
              validator: (value) => confirmPasswordValidator(value,
                  controller.newPasswordController),
              suffixIcon: IconButton(
                  onPressed: () => controller.toggleObscureC(),
                  icon: Icon(
                      controller.isObscureConfirm
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: greyClr,
                      size: 25.sp)));
        },
      ),
      Gap(32.h),
      GetBuilder<ChangePassController>(
          builder: (controller) => controller.isLoading
              ? customCircularProgressIndicator
              : CustomElevatedButton(
                  onPressed: () {
                    _submitChangePassword(context, controller);
                  },
                  buttonName: 'confirm'.tr)),
      Gap(32.h)
    ]));
  }

  void _submitChangePassword(
      BuildContext context, ChangePassController controller) async {
    final result = await controller.changingPassword(
        changePassData: ChangePassModel(
            oldPassword: controller.oldPasswordController.text,
            newPassword: controller.newPasswordController.text,
            confirmPassword: controller.confirmPasswordController.text));
    if (result) {
      Navigator.pop(context);
    }
  }

  void _submitProfile(ProfileUpdateController controller) async {
    if (controller.formKey.currentState!.validate()) {
      await controller.updateProfile(
        profileUpdateData: ProfileUpdateModel(
          name: controller.nameController.text,
          gender: controller.gender[controller.currentGender].value,
        ),
      );
    }
  }
}
