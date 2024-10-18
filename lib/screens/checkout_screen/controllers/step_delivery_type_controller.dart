import 'package:get/get.dart';
import 'package:islamic_marriage/screens/checkout_screen/models/delivery_option.dart';

class StepDeliveryTypeController extends GetxController{
  DeliveryOption? selectedOption;

  void deliveryTypeOnChanged(value){
    selectedOption = value;
    update();
  }
}