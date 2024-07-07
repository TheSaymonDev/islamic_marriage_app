import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage/routes/app_routes.dart';
import 'package:islamic_marriage/screens/identity_verification_screen/model/identity_verification.dart';
import 'package:islamic_marriage/screens/otp_verification_screen/controller/otp_verification_controller.dart';
import 'package:islamic_marriage/screens/otp_verification_screen/controller/resend_otp_controller.dart';
import 'package:islamic_marriage/screens/otp_verification_screen/controller/timer_controller.dart';
import 'package:islamic_marriage/screens/otp_verification_screen/model/otp_verification.dart';
import 'package:islamic_marriage/utils/app_colors.dart';
import 'package:islamic_marriage/widgets/custom_text_logo.dart';
import 'package:islamic_marriage/widgets/custom_appbar/custom_appbar.dart';
import 'package:islamic_marriage/widgets/custom_elevated_button.dart';
import 'package:islamic_marriage/utils/app_constant_functions.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final _otpController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String? phone;
  bool? isForgetOtp;

  @override
  void initState() {
    super.initState();
    Get.find<TimerController>().startTimer();
    phone = Get.arguments['phone'] as String;
    isForgetOtp = Get.arguments['isForgetOtp'] as bool;
  }

  @override
  void dispose() {
    Get.find<TimerController>().timer.cancel();
    super.dispose();
  }

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
                const CustomTextLogo(),
                Gap(150.h),
                Text('otpTitle'.tr,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: purpleClr)),
                Gap(8.h),
                Text('otpSubTitle'.tr,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: greyClr),
                    textAlign: TextAlign.center),
                Gap(32.h),
                PinCodeTextField(
                  backgroundColor: Colors.transparent,
                  controller: _otpController,
                  appContext: context,
                  length: 6,
                  obscureText: false,
                  cursorColor: lightFontClr,
                  animationType: AnimationType.fade,
                  animationDuration: const Duration(milliseconds: 300),
                  pinTheme: pinTheme(),
                  keyboardType: TextInputType.phone,
                ),
                _buildResendOtpRow(context),
                Gap(16.h),
                Visibility(
                    visible: isForgetOtp!,
                    replacement: GetBuilder<OtpVerificationController>(
                        builder: (controller) => controller.isLoading
                            ? customCircularProgressIndicator
                            : CustomElevatedButton(
                                onPressed: () =>
                                    _formOnSubmitRegister(controller),
                                buttonName: 'verifyAndProceed'.tr)),
                    child: GetBuilder<OtpVerificationController>(
                        builder: (controller) => controller.isLoading
                            ? customCircularProgressIndicator
                            : CustomElevatedButton(
                                onPressed: () =>
                                    _formOnSubmitSetPass(controller),
                                buttonName: 'verifyAndProceed'.tr)))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row _buildResendOtpRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("receiveCode".tr, style: Theme.of(context).textTheme.bodyMedium),
        Gap(8.w),
        GetBuilder<TimerController>(
          builder: (controller) {
            return controller.showResendButton
                ? GestureDetector(
                    onTap: () {
                      Get.find<ResendOTPController>().resendOTP(
                          resendOTP: IdentityVerification(phone: phone));
                    },
                    child: Text('resend'.tr,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(color: purpleClr)))
                : Text(controller.getFormattedDuration(),
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: purpleClr));
          },
        )
      ],
    );
  }

  void _clearData() {
    _otpController.clear();
  }

  void _formOnSubmitSetPass(OtpVerificationController controller) async {
    if (_formKey.currentState?.validate() ?? false) {
      final result = await controller.verifyOTP(
          otpVerification:
              OtpVerification(phone: phone, otp: _otpController.text.trim()));
      if (result == true) {
        Get.offNamed(AppRoutes.setPasswordScreen, arguments: {
          'phone': phone,
          'token': controller.token,
        });
        _clearData();
      }
    }
  }

  void _formOnSubmitRegister(OtpVerificationController controller) async {
    if (_formKey.currentState?.validate() ?? false) {
      final result = await controller.verifyOTP(
          otpVerification:
              OtpVerification(phone: phone, otp: _otpController.text.trim()));
      if (result == true) {
        Get.offAllNamed(AppRoutes.signInScreen);
        _clearData();
      }
    }
  }
}
