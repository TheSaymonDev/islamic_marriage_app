import 'package:get/get.dart';
import 'package:islamic_marriage/screens/otp_verification_screen/controllers/resend_otp_controller.dart';
import 'package:islamic_marriage/screens/sign_in_screen/controllers/sign_in_controller.dart';

class SignInBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => SignInController());
    Get.lazyPut(() => ResendOTPController());
  }
}