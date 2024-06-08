import 'package:get/get.dart';
import 'package:islamic_marriage/screens/profile_update_screen/model/change_password.dart';
import 'package:islamic_marriage/services/api_service.dart';
import 'package:islamic_marriage/utils/app_urls.dart';
import 'package:islamic_marriage/utils/app_constant_functions.dart';

class ChangePasswordController extends GetxController {
  bool isLoading = false;
  Future<bool> changingPassword({required ChangePassword changePassword}) async {
    isLoading = true;
    update();
    try {
      final response = await ApiService().post(
          url: AppUrls.changePasswordUrl, data: changePassword);
      if (response.success) {
        customSuccessMessage(message: 'Successfully Password Changed');
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
}
