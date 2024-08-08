import 'package:get/get.dart';
import 'package:islamic_marriage/screens/explore_screens/controller/all_user_controller.dart';
import 'package:islamic_marriage/screens/help_mate_screen/controller/all_bio_data_controller.dart';
import 'package:islamic_marriage/screens/home_screen/controller/bottom_nav_controller.dart';
import 'package:islamic_marriage/screens/wishlist_screen/controllers/wishlist_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(BottomNavController());
    Get.put(AllBioDataController());
    Get.put(AllUserController());
    Get.put(WishListController());
  }
}
