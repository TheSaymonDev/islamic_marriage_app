import 'package:get/get.dart';
import 'package:islamic_marriage/screens/home_screen/controller/bottom_nav_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(BottomNavController());
  }
}
