import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage/routes/app_routes.dart';
import 'package:islamic_marriage/screens/home_screen/home_screen.dart';
import 'package:islamic_marriage/screens/sign_in_screen/controller/sign_in_controller.dart';
import 'package:islamic_marriage/screens/sign_in_screen/model/sign_in.dart';
import 'package:islamic_marriage/utils/app_colors.dart';
import 'package:islamic_marriage/utils/app_text_styles.dart';
import 'package:islamic_marriage/utils/validator.dart';
import 'package:islamic_marriage/widgets/common_widgets/app_text_logo_widget.dart';
import 'package:islamic_marriage/widgets/common_widgets/custom_appbar/appbar_textview_with_back.dart';
import 'package:islamic_marriage/widgets/common_widgets/custom_elevated_button.dart';
import 'package:islamic_marriage/widgets/common_widgets/custom_text_form_field.dart';
import 'package:islamic_marriage/widgets/styles.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final _identifierController = TextEditingController();
  final _passwordController = TextEditingController();

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
                Gap(150.h),
                CustomTextFormField(
                    hintText: 'Identity',
                    validator: identifierValidator,
                    controller: _identifierController),
                Gap(16.h),
                GetBuilder<SignInController>(builder: (controller) {
                  return CustomTextFormField(
                      hintText: 'Password',
                      controller: _passwordController,
                      validator: passwordValidator,
                      obscureText: controller.isObscure,
                      suffixIcon: IconButton(
                          onPressed: () {
                            controller.toggleObscure();
                          },
                          icon: Icon(
                              controller.isObscure
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: AppColors.greyColor,
                              size: 25.sp)));
                }),
                Row(
                  children: [
                    GetBuilder<SignInController>(builder: (controller) {
                      return Checkbox(
                          value: controller.isChecked,
                          onChanged: (newValue) =>
                              controller.toggleIsChecked(newValue));
                    }),
                    Text('Remember me', style: AppTextStyles.bodyMedium()),
                    const Spacer(),
                    GestureDetector(
                        onTap: () {
                          Get.toNamed(AppRoutes.identityVerificationScreen);
                        },
                        child: Text("Forgot password?",
                            style: AppTextStyles.titleMedium(
                                color: AppColors.purpleClr)))
                  ],
                ),
                Gap(16.h),
                GetBuilder<SignInController>(
                    builder: (controller) => controller.isLoading
                        ? customCircularProgressIndicator
                        : CustomElevatedButton(
                            onPressed: () => _formOnSubmit(controller),
                            buttonName: 'Sign In')),
                Gap(150.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?",
                        style: AppTextStyles.bodyMedium()),
                    Gap(8.w),
                    GestureDetector(
                        onTap: () {
                          Get.toNamed(AppRoutes.signUpScreen);
                        },
                        child: Text("Create Account",
                            style: AppTextStyles.titleMedium(
                                color: AppColors.purpleClr)))
                  ],
                ),
                Gap(32.h),
                Text('Connect With', style: AppTextStyles.bodySmall()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(FontAwesomeIcons.facebook,
                            size: 30.sp, color: AppColors.blackClr)),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(FontAwesomeIcons.google,
                            size: 30.sp, color: AppColors.blackClr)),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(FontAwesomeIcons.instagram,
                            size: 30.sp, color: AppColors.blackClr)),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(FontAwesomeIcons.twitter,
                            size: 30.sp, color: AppColors.blackClr))
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
    _identifierController.clear();
    _passwordController.clear();
  }

  void _formOnSubmit(SignInController controller) async {
    if (_formKey.currentState?.validate() ?? false) {
      final inputText = _identifierController.text.trim();
      // Determine input type (email or phone number)
      bool isEmail = RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+\.[a-zA-Z]+")
          .hasMatch(inputText);
      String identity;
      if (isEmail) {
        identity = inputText; // Use email directly
      } else {
        identity = '+88$inputText'; // Prepend +88 for phone number
      }
      final result = await controller.signInUser(
        signIn: SignIn(
            identity: identity, password: _passwordController.text.trim()),
      );
      if (result == true) {
        _clearData();
        Get.offAll(() => const HomeScreen());
      }
    }
  }
}
