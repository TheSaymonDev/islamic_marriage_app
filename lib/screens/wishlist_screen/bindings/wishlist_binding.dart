import 'package:get/get.dart';
import 'package:islamic_marriage/screens/wishlist_screen/controllers/wishlist_controller.dart';

class WishlistBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(WishListController());
  }
}