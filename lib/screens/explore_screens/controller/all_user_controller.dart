import 'package:get/get.dart';
import 'package:islamic_marriage/screens/my_bio_data_screen/model/bio_data.dart';
import 'package:islamic_marriage/services/api_service.dart';
import 'package:islamic_marriage/utils/app_urls.dart';
import 'package:islamic_marriage/utils/app_constant_functions.dart';

class AllUserController extends GetxController {
  bool isLoading = false;
  List<BioData> bioData = [];
  int offset = 0;
  final int limit = 10;

  Future<void> readAllUser() async {
    _setLoadingState(true);
    try {
      final response = await ApiService().get(
        url: '${AppUrls.readAllBioDataUrl}?offset=$offset&limit=$limit',
        headers: AppUrls.getHeaderWithToken,
      );

      if (response.success) {
        List<dynamic> data = response.data['data']['biodata'];
        bioData = data.map((e) => BioData.fromJson(e)).toList();
        _setLoadingState(false);
      } else {
        _handleError(response.message['message'] ?? 'All Bio Data Read Failed');
      }
    } catch (error) {
      _handleError(error.toString());
    } finally {
      _setLoadingState(false);
    }
  }

  void _setLoadingState(bool state) {
    isLoading = state;
    update();
  }

  void _handleError(String errorMessage) {
    customErrorMessage(message: errorMessage);
    isLoading = false;
    update();
  }


}
