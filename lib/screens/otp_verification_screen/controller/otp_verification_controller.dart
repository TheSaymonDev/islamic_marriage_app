import 'package:get/get.dart';
import 'package:islamic_marriage/screens/otp_verification_screen/model/otp_verification.dart';
import 'package:islamic_marriage/services/api_service.dart';
import 'package:islamic_marriage/utils/app_urls.dart';
import 'package:islamic_marriage/utils/app_constant_functions.dart';

class OtpVerificationController extends GetxController {
  bool isLoading = false;
  String? token;

  Future<bool> verifyOTP({required OtpVerification otpVerification}) async {
    _setLoading(true);
    try {
      final response = await ApiService()
          .put(url: AppUrls.otpVerificationUrl, data: otpVerification);
      if (response.success) {
        customSuccessMessage(message: 'Otp Successfully Verified');
        token = response.data['data'];
        _setLoading(false);
        return true;
      } else {
        final errorMessage =
            response.message['message'] ?? 'OTP Verification Failed';
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
}
