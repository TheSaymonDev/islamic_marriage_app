import 'package:get/get.dart';
import 'package:islamic_marriage/screens/sign_up_screen/model/gender.dart';
import 'package:islamic_marriage/screens/sign_up_screen/model/sign_up.dart';
import 'package:islamic_marriage/services/api_service.dart';
import 'package:islamic_marriage/utils/app_urls.dart';
import 'package:islamic_marriage/utils/app_constant_functions.dart';

class SignUpController extends GetxController {
  bool isObscure = true;
  bool isLoading = false;
  bool isChecked = false;
  int currentGender = 0;
  List<Gender> gender = [
    Gender(title: 'male', value: 'male'),
    Gender(title: 'female', value: 'female')
  ];

  Future<bool> signUpUser({required SignUp signUp}) async {
    _setLoading(true);
    try {
      final response = await ApiService().post(
        url: AppUrls.signUpUrl,
        data: signUp,
      );
      _setLoading(false);
      if (response.success) {
        customSuccessMessage(message: 'Sent OTP Your Mobile');
        return true;
      } else {
        final errorMessage = response.message['message'] ?? 'Registration Failed';
        customErrorMessage(message: errorMessage);
        return false;
      }
    } catch (error) {
      customErrorMessage(message: error.toString());
      _setLoading(false);
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

  void selectGender(int index) {
    currentGender = index;
    update();
  }

  void _setLoading(bool value) {
    isLoading = value;
    update();
  }
}
