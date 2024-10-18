import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage/screens/otp_verification_screen/controllers/timer_controller.dart';
import 'package:islamic_marriage/screens/otp_verification_screen/models/otp_verification_model.dart';
import 'package:islamic_marriage/services/api_service.dart';
import 'package:islamic_marriage/services/connectivity_service.dart';
import 'package:islamic_marriage/utils/app_urls.dart';
import 'package:islamic_marriage/utils/app_constant_functions.dart';

class ForgetOtpVerificationController extends GetxController {
  bool isLoading = false;

  final otpController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  String? identity;

  Future<bool> verifyForgetOtp({required OtpVerificationModel otpVerificationData}) async {
    if (!await ConnectivityService.isConnected()) {
      customErrorMessage(message: 'Please check your internet connection');
      return false;
    }
    _setLoading(true);
    print(otpVerificationData.identity);
    print(otpVerificationData.otp);
    try {
      final response = await ApiService()
          .post(url: AppUrls.forgetOtpVerificationUrl, data: otpVerificationData);
      if (response.success) {
        customSuccessMessage(message: 'Otp Successfully Verified');
        _setLoading(false);
        return true;
      } else {
        final errorMessage =
            response.message['message'] ?? 'Otp Verification Failed';
        customErrorMessage(message: errorMessage);
        _setLoading(false);
        return false;
      }
    } catch (error) {
      customErrorMessage(message: error.toString());
      _setLoading(false);
      return false;
    }
  }

  void _setLoading(bool value) {
    isLoading = value;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    Get.find<TimerController>().startTimer();
    identity = Get.arguments['identity'] as String;
  }

  @override
  void dispose() {
    Get.find<TimerController>().timer.cancel();
    super.dispose();
  }

}
