import 'package:get/get.dart';
import 'package:islamic_marriage/screens/set_password_screen/controller/set_password_controller.dart';

class SetPasswordBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => SetPasswordController());
  }
}