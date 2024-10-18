import 'package:get/get.dart';
import 'package:islamic_marriage/screens/sign_up_screen/controllers/sign_up_controller.dart';

class SignUpBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => SignUpController());
  }
}