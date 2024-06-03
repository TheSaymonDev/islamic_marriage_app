import 'package:get/get.dart';
import 'package:islamic_marriage/screens/checkout_screen/controller/step_delivery_type_controller.dart';

class CheckoutBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => StepDeliveryTypeController());
  }
}