import 'package:get/get.dart';
import 'package:islamic_marriage/screens/set_password_screen/model/set_password.dart';
import 'package:islamic_marriage/services/api_service.dart';
import 'package:islamic_marriage/utils/app_urls.dart';
import 'package:islamic_marriage/utils/app_constant_functions.dart';

class SetPasswordController extends GetxController {
  bool isObscureNew = true;
  bool isObscureConfirm = true;
  bool isLoading = false;

  Future<bool> setNewPassword(
      {required SetPassword setPassword, required String token}) async {
    _setLoading(true);
    final headerWithToken = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    };
    try {
      final response = await ApiService().patch(
          url: AppUrls.setPasswordUrl,
          data: setPassword,
          headers: headerWithToken);
      if (response.success) {
        customSuccessMessage(message: 'Password Successfully Changed');
        _setLoading(false);
        return true;
      } else {
        final errorMessage =
            response.message['message'] ?? 'Password Change Failed';
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

  void toggleObscureN() {
    isObscureNew = !isObscureNew;
    update();
  }

  void toggleObscureC() {
    isObscureConfirm = !isObscureConfirm;
    update();
  }

  void _setLoading(bool value) {
    isLoading = value;
    update();
  }
}
