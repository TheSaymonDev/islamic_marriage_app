import 'package:get/get.dart';
import 'package:islamic_marriage/screens/identity_verification_screen/controllers/identity_verification_controller.dart';

class IdentityVerificationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => IdentityVerificationController());
  }
}
