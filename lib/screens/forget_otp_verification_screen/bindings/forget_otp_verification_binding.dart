import 'package:get/get.dart';
import 'package:islamic_marriage/screens/forget_otp_verification_screen/controllers/forget_otp_verification_controller.dart';
import 'package:islamic_marriage/screens/otp_verification_screen/controller/resend_otp_controller.dart';
import 'package:islamic_marriage/screens/otp_verification_screen/controller/timer_controller.dart';

class ForgetOtpVerificationBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ForgetOtpVerificationController());
    Get.lazyPut(() => TimerController());
    Get.lazyPut(() => ResendOTPController());
  }
}