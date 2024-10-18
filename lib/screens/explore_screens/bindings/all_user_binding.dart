import 'package:get/get.dart';
import 'package:islamic_marriage/screens/explore_screens/controllers/all_user_controller.dart';

class AllUserBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(AllUserController());
  }
}