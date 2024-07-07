import 'package:get/get.dart';
import 'package:islamic_marriage/localizations/language_controller.dart';
import 'package:islamic_marriage/themes/theme_controller.dart';

class AppInitialBindings implements Bindings{
  @override
  void dependencies() {
   Get.put(LanguageController());
   Get.put(ThemeController());
  }
}