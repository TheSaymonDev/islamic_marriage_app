import 'package:get/get.dart';
import 'package:islamic_marriage/screens/my_bio_data_screen/model/bio_data.dart';
import 'package:islamic_marriage/services/api_service.dart';
import 'package:islamic_marriage/services/shared_preference_service.dart';
import 'package:islamic_marriage/utils/app_urls.dart';
import 'package:islamic_marriage/utils/app_constant_functions.dart';

class MyBioDataController extends GetxController {
  bool isLoading = false;
  BioData? myBioData;

  Future<void> readMyBioData() async {
    isLoading = true;
    update();
    try {
      String userId = SharedPreferencesService().getUserId();
      final response = await ApiService().get(
          url: '${AppUrls.readUserBioDataUrl}/$userId',
          headers: AppUrls.getHeaderWithToken);
      if (response.success) {
        myBioData = BioData.fromJson(response.data['data']);
        isLoading = false;
        update();
      } else {
        final errorMessage =
            response.message['message'] ?? 'User Bio Data Read Failed';
        customErrorMessage(message: errorMessage);
        isLoading = false;
        update();
      }
    } catch (error) {
      customErrorMessage(message: error.toString());
      isLoading = false;
      update();
    }
  }
}
