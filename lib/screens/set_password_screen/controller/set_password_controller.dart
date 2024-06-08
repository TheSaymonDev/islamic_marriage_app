import 'package:get/get.dart';
import 'package:islamic_marriage/screens/set_password_screen/model/set_password.dart';
import 'package:islamic_marriage/services/api_service.dart';
import 'package:islamic_marriage/utils/app_urls.dart';
import 'package:islamic_marriage/utils/app_constant_functions.dart';

class SetPasswordController extends GetxController {
  bool isObscureNew = true;
  bool isObscureConfirm = true;
  bool isLoading = false;

  Future<bool> setNewPassword({required SetPassword setPassword}) async {
    isLoading = true;
    update();
    try {
      final response = await ApiService().post(
          url: AppUrls.setPasswordUrl, data: setPassword);
      if (response.success) {
        customSuccessMessage(message: 'Password Changed Successfully');
        // Navigate to the desired screen
        isLoading = false;
        update();
        return true;
      } else {
        final errorMessage = response.message['message'] ?? 'Password Change Failed';
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

  void toggleObscureN() {
    isObscureNew = !isObscureNew;
    update();
  }

  void toggleObscureC() {
    isObscureConfirm = !isObscureConfirm;
    update();
  }
}
