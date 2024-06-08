import 'package:get/get.dart';
import 'package:islamic_marriage/utils/app_constant_functions.dart';

class ProductDesController extends GetxController{
  bool isExpanded = false;
  void toggleDes() {
    isExpanded = !isExpanded;
    update();
  }

  int quantity = 1;
  void decrementQuantity() {
    if (quantity > 1) {
      quantity--;
    }
    update();
  }

  void incrementQuantity(int alertQuantity) {
    if (alertQuantity != quantity) {
      quantity++;
    }else{
      customErrorMessage(message: 'Out of Stock This Product');
    }
    update();
  }
}