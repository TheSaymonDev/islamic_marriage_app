import 'package:get/get.dart';
import 'package:islamic_marriage/screens/help_mate_screen/controllers/all_bio_data_controller.dart';

class HelpMateBinding implements Bindings{
  @override
  void dependencies() {
   Get.put(AllBioDataController());
  }
}