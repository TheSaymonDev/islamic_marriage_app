import 'package:get/get.dart';
import 'package:islamic_marriage/screens/help_center_screens/controller/contact_us_controller.dart';

class HelpCenterBinding implements Bindings{
  @override
  void dependencies() {
   Get.lazyPut(() => ContactUsController());
  }
}