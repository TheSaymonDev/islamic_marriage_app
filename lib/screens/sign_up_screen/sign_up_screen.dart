import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage/screens/otp_verification_screen/otp_verification_screen.dart';
import 'package:islamic_marriage/screens/sign_in_screen/sign_in_screen.dart';
import 'package:islamic_marriage/screens/sign_up_screen/controller/sign_up_controller.dart';
import 'package:islamic_marriage/screens/sign_up_screen/model/sign_up.dart';
import 'package:islamic_marriage/utils/app_colors.dart';
import 'package:islamic_marriage/utils/app_text_styles.dart';
import 'package:islamic_marriage/utils/validator.dart';
import 'package:islamic_marriage/widgets/common_widgets/app_text_logo_widget.dart';
import 'package:islamic_marriage/widgets/common_widgets/custom_appbar/appbar_textview_with_back.dart';
import 'package:islamic_marriage/widgets/common_widgets/custom_elevated_button.dart';
import 'package:islamic_marriage/widgets/common_widgets/custom_text_form_field.dart';
import 'package:islamic_marriage/widgets/styles.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _nameController = TextEditingController();

  final _mobileController = TextEditingController();

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
                const AppTextLogo(),
                Gap(120.h),
                GetBuilder<SignUpController>(builder: (controller) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                        controller.gender.length,
                        (index) => GestureDetector(
                              onTap: () => controller.selectGender(index),
                              child: Container(
                                height: 40.h,
                                width: 100.w,
                                margin: EdgeInsets.only(right: 16.w),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: AppColors.purple50Clr,
                                    borderRadius: BorderRadius.circular(4.r),
                                    border: Border.all(
                                        color: controller.currentGender == index
                                            ? AppColors.purpleClr
                                            : AppColors.whiteClr)),
                                child: Text(
                                  controller.gender[index].title,
                                  style: AppTextStyles.titleMedium(),
                                ),
                              ),
                            )),
                  );
                }),
                Gap(16.h),
                CustomTextFormField(
                  hintText: 'Name',
                  controller: _nameController,
                  validator: nameValidator,
                ),
                Gap(16.h),
                CustomTextFormField(
                  hintText: 'Mobile',
                  controller: _mobileController,
                  validator: mobileValidator,
                  keyBoardType: TextInputType.phone,
                ),
                Gap(16.h),
                CustomTextFormField(
                  hintText: 'Email',
                  controller: _emailController,
                  validator: emailValidator,
                ),
                Gap(16.h),
                GetBuilder<SignUpController>(builder: (controller) {
                  return CustomTextFormField(
                    hintText: 'Password',
                    controller: _passwordController,
                    obscureText: controller.isObscure,
                    validator: passwordValidator,
                    suffixIcon: IconButton(
                        onPressed: () => controller.toggleObscure(),
                        icon: Icon(
                          controller.isObscure
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: AppColors.greyColor,
                          size: 25.sp,
                        )),
                  );
                }),
                Row(
                  children: [
                    GetBuilder<SignUpController>(builder: (controller) {
                      return Checkbox(
                        value: controller.isChecked,
                        onChanged: (newValue) =>
                            controller.toggleIsChecked(newValue),
                      );
                    }),
                    Text('Remember me', style: AppTextStyles.bodyMedium()),
                  ],
                ),
                Gap(16.h),
                GetBuilder<SignUpController>(
                  builder: (controller) => controller.isLoading
                      ? customCircularProgressIndicator
                      : CustomElevatedButton(
                          onPressed: () => _formOnSubmit(controller),
                          buttonName: 'Sign Up'),
                ),
                Gap(120.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account?",
                        style: AppTextStyles.bodyMedium()),
                    Gap(8.w),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => const SignInScreen());
                      },
                      child: Text("Log In",
                          style: AppTextStyles.titleMedium(
                              color: AppColors.purpleClr)),
                    ),
                  ],
                ),
                Gap(32.h),
                Text('Connect With', style: AppTextStyles.bodySmall()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          FontAwesomeIcons.facebook,
                          size: 30.sp,
                          color: AppColors.blackClr,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          FontAwesomeIcons.google,
                          size: 30.sp,
                          color: AppColors.blackClr,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          FontAwesomeIcons.instagram,
                          size: 30.sp,
                          color: AppColors.blackClr,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          FontAwesomeIcons.twitter,
                          size: 30.sp,
                          color: AppColors.blackClr,
                        )),
                  ],
                ),
                Gap(32.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _clearData() {
    _emailController.clear();
    _nameController.clear();
    _mobileController.clear();
    _passwordController.clear();
  }

  _formOnSubmit(SignUpController controller) async {
    if (_formKey.currentState?.validate() ?? false) {
      final result = await controller.signUpUser(
          signUp: SignUp(
        fullName: _nameController.text.trim(),
        mobileNumber: '+88${_mobileController.text.trim()}',
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
        gender: controller.gender[controller.currentGender].value,
      ));
      if (result == true) {
        _clearData();
        Get.offAll(() => OtpVerificationScreen(mobileNumber: controller.mobileNumber, isForgetOtp: false));
      }
    }
  }
}
