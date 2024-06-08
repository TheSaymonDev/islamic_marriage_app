import 'package:get/get.dart';
import 'package:islamic_marriage/screens/identity_verification_screen/model/identity_verification.dart';
import 'package:islamic_marriage/services/api_service.dart';
import 'package:islamic_marriage/utils/app_urls.dart';
import 'package:islamic_marriage/utils/app_constant_functions.dart';

class IdentityVerificationController extends GetxController {
  bool isLoading = false;

  Future<bool> identityVerify({required IdentityVerification identityVerification}) async {
    isLoading = true;
    update();
    try {
      final response = await ApiService().post(
          url: AppUrls.identityUrl, data: identityVerification);
      if (response.success) {
        customSuccessMessage(message: 'Sent OTP Your Mobile');
        // Navigate to the desired screen
        isLoading = false;
        update();
        return true;
      } else {
        final errorMessage = response.message['message'] ?? 'OTP Sent Failed';
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
