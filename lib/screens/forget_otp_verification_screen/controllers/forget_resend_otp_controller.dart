import 'package:get/get.dart';
import 'package:islamic_marriage/screens/identity_verification_screen/models/identity_verification_model.dart';
import 'package:islamic_marriage/screens/otp_verification_screen/controllers/timer_controller.dart';
import 'package:islamic_marriage/services/api_service.dart';
import 'package:islamic_marriage/utils/app_urls.dart';
import 'package:islamic_marriage/utils/app_constant_functions.dart';

class ForgetResendOTPController extends GetxController{
  Future<void> resendOTP({required IdentityVerificationModel resendOtpData}) async {
    try {
      final response = await ApiService().post(
          url: AppUrls.identityUrl, data: resendOtpData);
      if (response.success) {
        customSuccessMessage(message: 'Resend OTP Your Mobile');
        // Reset timer duration
        Get.find<TimerController>().duration = const Duration(minutes: 2, seconds: 30);
        // Restart the timer
        Get.find<TimerController>().startTimer();
      } else {
        final errorMessage = response.message['message'] ?? 'OTP Sent Failed';
        customErrorMessage(message: errorMessage);
      }
    } catch (error) {
      customErrorMessage(message: error.toString());
    }
  }
}