import 'package:get/get.dart';
import 'package:islamic_marriage/screens/sign_up_screen/model/gender.dart';
import 'package:islamic_marriage/screens/sign_up_screen/model/sign_up.dart';
import 'package:islamic_marriage/services/api_service.dart';
import 'package:islamic_marriage/utils/app_urls.dart';
import 'package:islamic_marriage/utils/app_constant_functions.dart';

class SignUpController extends GetxController {
  bool isObscure = true;
  String? mobileNumber;
  bool isLoading = false;
  bool isChecked = false;
  int currentGender = 0;
  List<Gender> gender = [
    Gender(title: 'Male', value: 'male'),
    Gender(title: 'Female', value: 'female')
  ];

  Future<bool> signUpUser({required SignUp signUp}) async {
    isLoading = true;
    update();
    try {
      final response = await ApiService().post(
          url: AppUrls.signUpUrl, data: signUp);
      if (response.success) {
        customSuccessMessage(message: 'Sent OTP Your Mobile');
        mobileNumber = response.data['data'];
        // Navigate to the desired screen
        isLoading = false;
        update();
        return true;
      } else {
        final errorMessage = response.message['message'] ?? 'Registration Failed';
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

  void selectGender(int index) {
    currentGender = index;
    update();
  }
}
