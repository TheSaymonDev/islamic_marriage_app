import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage/routes/app_routes.dart';
import 'package:islamic_marriage/screens/identity_verification_screen/model/identity_verification.dart';
import 'package:islamic_marriage/screens/otp_verification_screen/controller/resend_otp_controller.dart';
import 'package:islamic_marriage/screens/sign_in_screen/controller/sign_in_controller.dart';
import 'package:islamic_marriage/screens/sign_in_screen/model/sign_in.dart';
import 'package:islamic_marriage/utils/app_colors.dart';
import 'package:islamic_marriage/utils/app_validators.dart';
import 'package:islamic_marriage/widgets/custom_text_logo.dart';
import 'package:islamic_marriage/widgets/custom_appbar/custom_appbar.dart';
import 'package:islamic_marriage/widgets/custom_elevated_button.dart';
import 'package:islamic_marriage/widgets/custom_text_form_field.dart';
import 'package:islamic_marriage/utils/app_constant_functions.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final _identityController = TextEditingController();
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
                const CustomTextLogo(),
                Gap(150.h),
                CustomTextFormField(
                    hintText: 'logInIdentityHint'.tr,
                    validator: identifierValidator,
                    controller: _identityController),
                Gap(16.h),
                GetBuilder<SignInController>(
                  builder: (controller) {
                    return CustomTextFormField(
                        hintText: 'logInPasswordHint'.tr,
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
                                color: greyClr,
                                size: 25.sp)));
                  },
                ),
                _buildRememberMeAndForgotPasswordRow(context),
                Gap(16.h),
                GetBuilder<SignInController>(
                    builder: (controller) => controller.isLoading
                        ? customCircularProgressIndicator
                        : CustomElevatedButton(
                            onPressed: () => _formOnSubmit(controller),
                            buttonName: 'signIn'.tr)),
                Gap(150.h),
                _buildSignUpRow(context),
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

  Row _buildRememberMeAndForgotPasswordRow(BuildContext context) {
    return Row(
      children: [
        GetBuilder<SignInController>(builder: (controller) {
          return Checkbox(
              value: controller.isChecked,
              onChanged: (newValue) => controller.toggleIsChecked(newValue!));
        }),
        Text('rememberMe'.tr, style: Theme.of(context).textTheme.bodyMedium),
        const Spacer(),
        GestureDetector(
            onTap: () {
              Get.toNamed(AppRoutes.identityVerificationScreen);
            },
            child: Text("forgotPassword".tr,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: purpleClr)))
      ],
    );
  }

  Row _buildSignUpRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("haveAnAccount".tr, style: Theme.of(context).textTheme.bodySmall),
        Gap(8.w),
        GestureDetector(
            onTap: () {
              Get.toNamed(AppRoutes.signUpScreen);
            },
            child: Text("createAccount".tr,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: purpleClr)))
      ],
    );
  }

  Row _buildSocialConnect() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
            onPressed: () {},
            icon: Icon(FontAwesomeIcons.facebook, size: 30.sp)),
        IconButton(
            onPressed: () {}, icon: Icon(FontAwesomeIcons.google, size: 30.sp)),
        IconButton(
            onPressed: () {},
            icon: Icon(FontAwesomeIcons.instagram, size: 30.sp)),
        IconButton(
            onPressed: () {}, icon: Icon(FontAwesomeIcons.twitter, size: 30.sp))
      ],
    );
  }

  void _clearData() {
    _identityController.clear();
    _passwordController.clear();
  }

  void _formOnSubmit(SignInController controller) async {
    if (_formKey.currentState?.validate() ?? false) {
      final inputText = _identityController.text.trim();
      final isEmail = RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+\.[a-zA-Z]+")
          .hasMatch(inputText);
      final identity =
      isEmail ? inputText : inputText; // Prepend for phone number if needed
      final result = await controller.signInUser(
        signIn: SignIn(
            identity: identity, password: _passwordController.text.trim()),
      );
      print(result);
      if (result == 'User not verified') {
        final identityVerification =
        IdentityVerification(identity: _identityController.text.trim());
        Get.find<ResendOTPController>()
            .resendOTP(resendOTP: identityVerification);
        Get.toNamed(AppRoutes.otpVerificationScreen, arguments: {
          'identity': _identityController.text.trim(),
        });
        _clearData();
      } else if (result == 'Login Successful') {
        Get.offAllNamed(AppRoutes.homeScreen);
        _clearData();
      } else {
       customErrorMessage(message: result);
      }
    }
  }

}
