import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage/routes/app_routes.dart';
import 'package:islamic_marriage/screens/set_password_screen/controllers/set_password_controller.dart';
import 'package:islamic_marriage/screens/set_password_screen/models/set_password_model.dart';
import 'package:islamic_marriage/utils/app_colors.dart';
import 'package:islamic_marriage/utils/app_validators.dart';
import 'package:islamic_marriage/widgets/custom_text_logo.dart';
import 'package:islamic_marriage/widgets/custom_appbar/custom_appbar.dart';
import 'package:islamic_marriage/widgets/custom_elevated_button.dart';
import 'package:islamic_marriage/widgets/custom_text_form_field.dart';
import 'package:islamic_marriage/utils/app_constant_functions.dart';

class SetPasswordScreen extends StatelessWidget {
  SetPasswordScreen({super.key});

  final _setPasswordController = Get.find<SetPasswordController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(onPressedBack: () {
        Get.back();
      }),
      body: Container(
        height: double.infinity.h,
        width: double.infinity.w,
        padding: EdgeInsets.symmetric(horizontal: 32.w),
        child: SingleChildScrollView(
          child: Form(
            key: _setPasswordController.formKey,
            child: Column(
              children: [
                Gap(32.h),
                const CustomTextLogo(),
                Gap(150.h),
                Text('setPasswordTitle'.tr,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: purpleClr)),
                Gap(8.h),
                Text('setPasswordSubTitle'.tr,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: greyClr),
                    textAlign: TextAlign.center),
                Gap(32.h),
                GetBuilder<SetPasswordController>(builder: (controller) {
                  return CustomTextFormField(
                    hintText: 'setPasswordNewPassHint'.tr,
                    controller: _setPasswordController.newPasswordController,
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
                GetBuilder<SetPasswordController>(
                  builder: (controller) {
                    return CustomTextFormField(
                        hintText: 'setPasswordConPassHint'.tr,
                        controller:
                            _setPasswordController.confirmPasswordController,
                        obscureText: controller.isObscureConfirm,
                        validator: (value) => confirmPasswordValidator(value,
                            _setPasswordController.newPasswordController),
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
                Gap(16.h),
                GetBuilder<SetPasswordController>(
                    builder: (controller) => controller.isLoading
                        ? customCircularProgressIndicator
                        : CustomElevatedButton(
                            onPressed: () => _formOnSubmit(controller),
                            buttonName: 'recoverPass'.tr))
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _clearData() {
    _setPasswordController.newPasswordController.clear();
    _setPasswordController.confirmPasswordController.clear();
  }

  void _formOnSubmit(SetPasswordController controller) async {
    if (controller.formKey.currentState!.validate()) {
      final result = await controller.setNewPassword(
          setPasswordData: SetPasswordModel(
              identity: controller.identity,
              password: controller.newPasswordController.text.trim()));
      if (result == true) {
        _clearData();
        Get.offAllNamed(AppRoutes.signInScreen);
      }
    }
  }
}
