import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage/routes/app_routes.dart';
import 'package:islamic_marriage/screens/sign_up_screen/controller/sign_up_controller.dart';
import 'package:islamic_marriage/screens/sign_up_screen/model/sign_up.dart';
import 'package:islamic_marriage/utils/app_colors.dart';
import 'package:islamic_marriage/utils/app_validators.dart';
import 'package:islamic_marriage/widgets/custom_text_logo.dart';
import 'package:islamic_marriage/widgets/custom_appbar/custom_appbar.dart';
import 'package:islamic_marriage/widgets/custom_elevated_button.dart';
import 'package:islamic_marriage/widgets/custom_gender_selection.dart';
import 'package:islamic_marriage/widgets/custom_text_form_field.dart';
import 'package:islamic_marriage/utils/app_constant_functions.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(onPressedBack: () {
        Get.back();
      }),
      body: Container(
        height: double.infinity.h,
        width: double.infinity.w,
        padding: EdgeInsets.symmetric(horizontal: 32.h),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Gap(32.h),
                const CustomTextLogo(),
                Gap(84.h),
                GetBuilder<SignUpController>(builder: (controller) {
                  return CustomGenderSelection(
                      genders: controller.gender,
                      currentGender: controller.currentGender,
                      onGenderSelected: (index) =>
                          controller.selectGender(index));
                }),
                Gap(16.h),
                CustomTextFormField(
                    hintText: 'signUpNameHint'.tr,
                    controller: _nameController,
                    validator: nameValidator),
                Gap(16.h),
                CustomTextFormField(
                    hintText: 'signUpMobileHint'.tr,
                    controller: _phoneController,
                    validator: phoneValidator,
                    keyBoardType: TextInputType.phone),
                Gap(16.h),
                CustomTextFormField(
                    hintText: 'signUpEmailHint'.tr,
                    controller: _emailController,
                    validator: emailValidator),
                Gap(16.h),
                GetBuilder<SignUpController>(builder: (controller) {
                  return CustomTextFormField(
                      hintText: 'signUpPasswordHint'.tr,
                      controller: _passwordController,
                      obscureText: controller.isObscure,
                      validator: passwordValidator,
                      suffixIcon: IconButton(
                          onPressed: () => controller.toggleObscure(),
                          icon: Icon(
                              controller.isObscure
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: greyClr,
                              size: 25.sp)));
                }),
                // _buildRememberMeRow(context),
                Gap(24.h),
                GetBuilder<SignUpController>(
                    builder: (controller) => controller.isLoading
                        ? customCircularProgressIndicator
                        : CustomElevatedButton(
                            onPressed: () => _formOnSubmit(controller),
                            buttonName: 'signUp'.tr)),
                Gap(96.h),
                _buildLogInRow(context),
                Gap(32.h),
                Text('connectWith'.tr,
                    style: Theme.of(context).textTheme.bodySmall),
                _buildSocialConnect(),
                Gap(32.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Row _buildRememberMeRow(BuildContext context) {
  //   return Row(
  //     children: [
  //       GetBuilder<SignUpController>(builder: (controller) {
  //         return Checkbox(
  //           value: controller.isChecked,
  //           onChanged: (newValue) => controller.toggleIsChecked(newValue),
  //         );
  //       }),
  //       Text('rememberMe'.tr, style: Theme.of(context).textTheme.bodyMedium)
  //     ],
  //   );
  // }

  Row _buildLogInRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("alreadyAccount".tr,
            style: Theme.of(context).textTheme.bodyMedium),
        Gap(8.w),
        GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Text("logIn".tr,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: purpleClr)))
      ],
    );
  }

  Row _buildSocialConnect() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
            onPressed: () {
              Get.find<SignUpController>().launchInBrowser(
                  Uri.parse('https://www.facebook.com/islamicmarriage.net'));
            },
            icon: Icon(FontAwesomeIcons.facebook, size: 30.sp)),
        IconButton(
            onPressed: () {
              Get.find<SignUpController>().launchInBrowser(
                  Uri.parse('https://www.linkedin.com/company/islamicmarrige'));
            },
            icon: Icon(FontAwesomeIcons.linkedin, size: 30.sp)),
        IconButton(
            onPressed: () {
              Get.find<SignUpController>()
                  .launchInBrowser(Uri.parse('https://x.com/IMarriageBD'));
            },
            icon: Icon(FontAwesomeIcons.twitter, size: 30.sp))
      ],
    );
  }

  void _clearData() {
    _emailController.clear();
    _nameController.clear();
    _phoneController.clear();
    _passwordController.clear();
  }

  _formOnSubmit(SignUpController controller) async {
    if (_formKey.currentState?.validate() ?? false) {
      final result = await controller.signUpUser(
          signUp: SignUp(
        name: _nameController.text,
        phone: _phoneController.text.trim(),
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
        gender: controller.gender[controller.currentGender].value,
      ));
      if (result == true) {
        Get.offAllNamed(
          AppRoutes.otpVerificationScreen,
          arguments: {
            'identity': controller.identity,
          },
        );
        _clearData();
      }
    }
  }
}
