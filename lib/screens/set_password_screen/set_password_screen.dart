import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage/screens/set_password_screen/controller/set_password_controller.dart';
import 'package:islamic_marriage/screens/set_password_screen/model/set_password.dart';
import 'package:islamic_marriage/screens/sign_in_screen/sign_in_screen.dart';
import 'package:islamic_marriage/utils/app_colors.dart';
import 'package:islamic_marriage/utils/app_text_styles.dart';
import 'package:islamic_marriage/utils/validator.dart';
import 'package:islamic_marriage/widgets/common_widgets/app_text_logo_widget.dart';
import 'package:islamic_marriage/widgets/common_widgets/custom_appbar/appbar_textview_with_back.dart';
import 'package:islamic_marriage/widgets/common_widgets/custom_elevated_button.dart';
import 'package:islamic_marriage/widgets/common_widgets/custom_text_form_field.dart';
import 'package:islamic_marriage/widgets/styles.dart';

class SetPasswordScreen extends StatelessWidget {
  final String mobileNumber;
  final String otp;

  SetPasswordScreen({super.key, required this.mobileNumber, required this.otp});

  final _formKey = GlobalKey<FormState>();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

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
            key: _formKey,
            child: Column(
              children: [
                Gap(32.h),
                const AppTextLogo(),
                Gap(150.h),
                Text('Enter New Password',
                    style:
                        AppTextStyles.titleLarge(color: AppColors.purpleClr)),
                Gap(8.h),
                Text(
                  'Your new password must be different\nfrom previously used password.',
                  style: AppTextStyles.bodyMedium(color: AppColors.greyColor),
                  textAlign: TextAlign.center,
                ),
                Gap(32.h),
                GetBuilder<SetPasswordController>(builder: (controller) {
                  return CustomTextFormField(
                    hintText: 'New Password',
                    controller: _newPasswordController,
                    obscureText: controller.isObscureNew,
                    validator: passwordValidator,
                    suffixIcon: IconButton(
                        onPressed: () => controller.toggleObscureN(),
                        icon: Icon(
                          controller.isObscureNew
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: AppColors.greyColor,
                          size: 25.sp,
                        )),
                  );
                }),
                Gap(16.h),
                GetBuilder<SetPasswordController>(builder: (controller) {
                  return CustomTextFormField(
                    hintText: 'Confirm Password',
                    controller: _confirmPasswordController,
                    obscureText: controller.isObscureConfirm,
                    validator: (value) =>
                        confirmPasswordValidator(value, _newPasswordController),
                    suffixIcon: IconButton(
                        onPressed: () => controller.toggleObscureC(),
                        icon: Icon(
                          controller.isObscureConfirm
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: AppColors.greyColor,
                          size: 25.sp,
                        )),
                  );
                }),
                Gap(16.h),
                GetBuilder<SetPasswordController>(
                    builder: (controller) => controller.isLoading
                        ? customCircularProgressIndicator
                        : CustomElevatedButton(
                            onPressed: () => _formOnSubmit(controller),
                            buttonName: 'Recover Password'))
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _clearData() {
    _newPasswordController.clear();
    _confirmPasswordController.clear();
  }

  void _formOnSubmit(SetPasswordController controller) async {
    if (_formKey.currentState?.validate() ?? false) {
      final result = await controller.setNewPassword(
          setPassword: SetPassword(
              mobileNumber: mobileNumber,
              otp: otp,
              newPassword: _newPasswordController.text.trim()));
      if (result == true) {
        _clearData();
        Get.offAll(const SignInScreen());
      }
    }
  }
}
