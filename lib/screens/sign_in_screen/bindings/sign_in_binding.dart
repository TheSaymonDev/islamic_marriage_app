import 'package:get/get.dart';
import 'package:islamic_marriage/screens/sign_in_screen/controller/sign_in_controller.dart';

class SignInBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => SignInController());
  }
}