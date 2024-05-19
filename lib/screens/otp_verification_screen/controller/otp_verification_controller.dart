import 'package:get/get.dart';
import 'package:islamic_marriage/screens/otp_verification_screen/model/otp_verification.dart';
import 'package:islamic_marriage/services/api_service.dart';
import 'package:islamic_marriage/utils/app_urls.dart';
import 'package:islamic_marriage/widgets/styles.dart';

class OtpVerificationController extends GetxController {
  bool isLoading = false;

  Future<bool> verifyOTP({required OtpVerification otpVerification}) async {
    isLoading = true;
    update();
    try {
      final response = await ApiService().post(
          url: AppUrls.otpVerificationUrl, data: otpVerification);
      if (response.success) {
        customSuccessMessage(message: 'Otp Successfully Verified');
        // Navigate to the desired screen
        isLoading = false;
        update();
        return true;
      } else {
        final errorMessage = response.message['message'] ?? 'OTP Verification Failed';
        customErrorMessage(message: errorMessage);
        isLoading = false;
        update();
        return false;
      }
    } catch (error) {
      customErrorMessage(message: error.toString());
      isLoading = false;
      update();
      return false;
    }
  }
}
