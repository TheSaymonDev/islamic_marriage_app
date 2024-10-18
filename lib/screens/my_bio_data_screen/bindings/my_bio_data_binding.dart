import 'package:get/get.dart';
import 'package:islamic_marriage/screens/my_bio_data_screen/controllers/my_bio_data_controller.dart';

class MyBioDataBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => MyBioDataController());
  }
}