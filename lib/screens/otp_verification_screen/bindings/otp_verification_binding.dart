import 'package:get/get.dart';
import 'package:islamic_marriage/screens/otp_verification_screen/controller/otp_verification_controller.dart';
import 'package:islamic_marriage/screens/otp_verification_screen/controller/resend_otp_controller.dart';
import 'package:islamic_marriage/screens/otp_verification_screen/controller/timer_controller.dart';

class OtpVerificationBinding implements Bindings{
  @override
  void dependencies() {
   Get.lazyPut(() => OtpVerificationController());
   Get.lazyPut(() => TimerController());
   Get.lazyPut(() => ResendOTPController());
  }
}