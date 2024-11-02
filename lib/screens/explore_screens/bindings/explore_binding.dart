import 'package:get/get.dart';
import 'package:islamic_marriage/screens/explore_screens/controllers/all_bio_data_controller.dart';

class ExploreBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(AllBioDataController());
  }
}