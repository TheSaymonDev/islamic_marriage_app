import 'package:get/get.dart';
import 'package:islamic_marriage/screens/sign_in_screen/model/sign_in.dart';
import 'package:islamic_marriage/services/api_service.dart';
import 'package:islamic_marriage/services/shared_preference_service.dart';
import 'package:islamic_marriage/utils/app_urls.dart';
import 'package:islamic_marriage/utils/app_constant_functions.dart';

class SignInController extends GetxController {
  bool isLoading = false;
  bool isObscure = true;
  bool isChecked = false;

  Future<String> signInUser({required SignIn signIn}) async {
    _setLoading(true);
    try {
      final response = await ApiService().post(url: AppUrls.signInUrl, data: signIn);
      _setLoading(false);

      print('Response: $response'); // Debug print to check the response structure

      if (response.success) {
        final message = response.data['message'];
        if (message == 'Login Successful') {
          customSuccessMessage(message: 'Successfully Log In');
          SharedPreferencesService().saveUserData(response.data);
        } else if (message == 'User not verified') {
          customErrorMessage(message: message);
        }
        return message;
      } else {
        final errorMessage = response.message['message'] ?? 'Log In Failed';
        customErrorMessage(message: errorMessage);
        return errorMessage;
      }
    } catch (error) {
      _setLoading(false);
      customErrorMessage(message: error.toString());
      return error.toString();
    }
  }

  void toggleObscure() {
    isObscure = !isObscure;
    update();
  }

  void toggleIsChecked(bool newValue) {
    isChecked = newValue;
    update();
  }

  void _setLoading(bool value) {
    isLoading = value;
    update();
  }
}
