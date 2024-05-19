import 'package:get/get.dart';
import 'package:islamic_marriage/screens/my_bio_data_screen/model/bio_data.dart';
import 'package:islamic_marriage/services/api_service.dart';
import 'package:islamic_marriage/utils/app_urls.dart';
import 'package:islamic_marriage/widgets/styles.dart';

class AllBioDataController extends GetxController {
  bool isLoading = false;
  List<BioData> bioData = [];

  Future<void> readAllBioData() async {
    isLoading = true;
    update();
    try {
      final response = await ApiService().get(
        url: AppUrls.readAllBioDataUrl,
        headers: AppUrls.getHeaderWithToken,
      );
      if (response.success) {
        List<dynamic> data = response.data['data']['biodata'];
        bioData = data.map((e) => BioData.fromJson(e)).toList();
        isLoading = false;
        update();
      } else {
        final errorMessage =
            response.message['message'] ?? 'All Bio Data Read Failed';
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
