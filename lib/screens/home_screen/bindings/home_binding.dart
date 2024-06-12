import 'package:get/get.dart';
import 'package:islamic_marriage/screens/explore_screens/controller/all_user_controller.dart';
import 'package:islamic_marriage/screens/help_mate_screen/controller/all_bio_data_controller.dart';

class HomeBinding implements Bindings{
  @override
  void dependencies() {
  Get.lazyPut(() => AllBioDataController());
  Get.lazyPut(() => AllUserController());
  }
}