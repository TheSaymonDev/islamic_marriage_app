import 'package:get/get.dart';
import 'package:islamic_marriage/screens/profile_update_screen/controllers/change_pass_controller.dart';
import 'package:islamic_marriage/screens/profile_update_screen/controllers/profile_update_controller.dart';

class ProfileUpdateBinding implements Bindings{
  @override
  void dependencies() {
   Get.lazyPut(() => ProfileUpdateController());
   Get.put(ChangePassController());
  }
}