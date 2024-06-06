import 'package:get/get.dart';
import 'package:islamic_marriage/screens/sign_up_screen/controller/sign_up_controller.dart';

class SignUpBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => SignUpController());
  }
}