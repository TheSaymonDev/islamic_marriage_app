import 'package:get/get.dart';
import 'package:islamic_marriage/screens/profile_update_screen/controller/profile_update_controller.dart';

class ProfileUpdateBinding implements Bindings{
  @override
  void dependencies() {
   Get.lazyPut(() => ProfileUpdateController(),);
  }
}