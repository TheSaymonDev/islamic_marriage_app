import 'package:get/get.dart';
import 'package:islamic_marriage/screens/identity_verification_screen/model/identity_verification.dart';
import 'package:islamic_marriage/services/api_service.dart';
import 'package:islamic_marriage/services/connectivity_service.dart';
import 'package:islamic_marriage/utils/app_urls.dart';
import 'package:islamic_marriage/utils/app_constant_functions.dart';

class IdentityVerificationController extends GetxController {
  bool isLoading = false;
  int? userId;

  Future<bool> identityVerify(
      {required IdentityVerification identityVerification}) async {
    if (!await ConnectivityService.isConnected()) {
      customErrorMessage(message: 'Please check your internet connection');
      return false;
    }
    _setLoading(true);
    try {
      final response = await ApiService()
          .post(url: AppUrls.identityUrl, data: identityVerification);
      if (response.success) {
        customSuccessMessage(message: 'Sent OTP Your Mobile');
        userId =  response.data['data']['user_id'];
        _setLoading(false);
        return true;
      } else {
        final errorMessage = response.message['message'] ?? 'OTP Sent Failed';
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
