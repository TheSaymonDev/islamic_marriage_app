import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage/routes/app_routes.dart';
import 'package:islamic_marriage/screens/otp_verification_screen/controller/otp_verification_controller.dart';
import 'package:islamic_marriage/screens/otp_verification_screen/controller/resend_otp_controller.dart';
import 'package:islamic_marriage/screens/otp_verification_screen/controller/timer_controller.dart';
import 'package:islamic_marriage/screens/otp_verification_screen/model/otp_verification.dart';
import 'package:islamic_marriage/screens/otp_verification_screen/model/resend_otp.dart';
import 'package:islamic_marriage/utils/app_colors.dart';
import 'package:islamic_marriage/utils/app_text_styles.dart';
import 'package:islamic_marriage/widgets/common_widgets/app_text_logo_widget.dart';
import 'package:islamic_marriage/widgets/common_widgets/custom_appbar/appbar_textview_with_back.dart';
import 'package:islamic_marriage/widgets/common_widgets/custom_elevated_button.dart';
import 'package:islamic_marriage/widgets/styles.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final _otpController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String? mobileNumber;
  bool? isForgetOtp;

  @override
  void initState() {
    super.initState();
    Get.find<TimerController>().startTimer();
    mobileNumber = Get.arguments['mobileNumber'] as String;
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
                const AppTextLogo(),
                Gap(150.h),
                Text('Get Your Code',
                    style:
                        AppTextStyles.titleLarge(color: AppColors.purpleClr)),
                Gap(8.h),
                Text(
                    'Please enter the 6 digit code that\nsend to your mobile number',
                    style: AppTextStyles.bodyMedium(color: AppColors.greyColor),
                    textAlign: TextAlign.center),
                Gap(32.h),
                PinCodeTextField(
                  controller: _otpController,
                  appContext: context,
                  length: 6,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  animationDuration: const Duration(milliseconds: 300),
                  pinTheme: pinTheme(),
                  keyboardType: TextInputType.phone,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Didn't received a code?",
                        style: AppTextStyles.bodyMedium()),
                    Gap(8.w),
                    GetBuilder<TimerController>(
                      builder: (controller) {
                        print(controller.getFormattedDuration());
                        return controller.showResendButton
                            ? GestureDetector(
                                onTap: () {
                                  Get.find<ResendOTPController>().resendOTP(
                                      resendOTP: ResendOTP(
                                          mobileNumber: mobileNumber));
                                },
                                child: Text('Resend Code',
                                    style: AppTextStyles.titleMedium(
                                        color: AppColors.purpleClr)))
                            : Text(controller.getFormattedDuration(),
                                style: AppTextStyles.titleMedium(
                                    color: AppColors.purpleClr));
                      },
                    )
                  ],
                ),
                Gap(16.h),
                Visibility(
                    visible: isForgetOtp!,
                    replacement: GetBuilder<OtpVerificationController>(
                        builder: (controller) => controller.isLoading
                            ? customCircularProgressIndicator
                            : CustomElevatedButton(
                                onPressed: () =>
                                    _formOnSubmitRegister(controller),
                                buttonName: 'Verify and Proceed')),
                    child: GetBuilder<OtpVerificationController>(
                        builder: (controller) => controller.isLoading
                            ? customCircularProgressIndicator
                            : CustomElevatedButton(
                                onPressed: () =>
                                    _formOnSubmitSetPass(controller),
                                buttonName: 'Verify and Proceed')))
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _clearData() {
    _otpController.clear();
  }

  void _formOnSubmitSetPass(OtpVerificationController controller) async {
    if (_formKey.currentState?.validate() ?? false) {
      final result = await controller.verifyOTP(
          otpVerification: OtpVerification(
              mobileNumber: mobileNumber, otp: _otpController.text.trim()));
      if (result == true) {
        Get.offNamed(AppRoutes.setPasswordScreen, arguments: {
          'mobileNumber': mobileNumber,
          'otp': _otpController.text.trim()
        });
      }
    }
  }

  void _formOnSubmitRegister(OtpVerificationController controller) async {
    if (_formKey.currentState?.validate() ?? false) {
      final result = await controller.verifyOTP(
          otpVerification: OtpVerification(
              mobileNumber: mobileNumber, otp: _otpController.text.trim()));
      if (result == true) {
        _clearData();
        Get.offAllNamed(AppRoutes.signInScreen);
      }
    }
  }
}
