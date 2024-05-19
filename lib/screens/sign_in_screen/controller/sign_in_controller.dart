import 'package:get/get.dart';
import 'package:islamic_marriage/screens/sign_in_screen/model/sign_in.dart';
import 'package:islamic_marriage/services/api_service.dart';
import 'package:islamic_marriage/services/shared_preference_service.dart';
import 'package:islamic_marriage/utils/app_urls.dart';
import 'package:islamic_marriage/widgets/styles.dart';

class SignInController extends GetxController {
  bool isLoading = false;
  bool isObscure = true;
  bool isChecked = false;

  Future<bool> signInUser({required SignIn signIn}) async {
    isLoading = true;
    update();
    try {
      final response = await ApiService().post(
          url: AppUrls.signInUrl, data: signIn);
      if (response.success) {
        SharedPreferencesService().saveUserData(response.data['data']);
        customSuccessMessage(message: 'Successfully Log In');
        // Navigate to the desired screen
        isLoading = false;
        update();
        return true;
      } else {
        final errorMessage = response.message['message'] ?? 'Log In Failed';
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

  void toggleObscure() {
    isObscure = !isObscure;
    update();
  }

  void toggleIsChecked(newValue) {
    isChecked = newValue;
    update();
  }
}
