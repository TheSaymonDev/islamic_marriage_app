import 'package:get/get.dart';
import 'package:islamic_marriage/screens/otp_verification_screen/controllers/otp_verification_controller.dart';
import 'package:islamic_marriage/screens/otp_verification_screen/controllers/resend_otp_controller.dart';
import 'package:islamic_marriage/screens/otp_verification_screen/controllers/timer_controller.dart';

class OtpVerificationBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => TimerController());
   Get.lazyPut(() => OtpVerificationController());
   Get.lazyPut(() => ResendOTPController());
  }
}