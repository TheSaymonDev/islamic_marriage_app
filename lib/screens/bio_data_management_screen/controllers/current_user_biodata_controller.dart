import 'package:get/get.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/models/current_user_model.dart';
import 'package:islamic_marriage/services/api_service.dart';
import 'package:islamic_marriage/services/connectivity_service.dart';
import 'package:islamic_marriage/utils/app_urls.dart';
import 'package:islamic_marriage/utils/app_constant_functions.dart';

class CurrentUserBioDataController extends GetxController {
  bool isLoading = false;
  CurrentUserModel? currentUserData;

  Future<void> getCurrentUserData() async {
    if (!await ConnectivityService.isConnected()) {
      customErrorMessage(message: 'Please check your internet connection');
      return;
    }
    _setLoading(true);
    try {
      final response = await ApiService().get(
          url: AppUrls.getCurrentUser,
          headers: AppUrls.getHeaderWithToken);
      if (response.success) {
        currentUserData = CurrentUserModel.fromJson(response.data);
        _setLoading(false);
      } else {
        final errorMessage =
            response.message['message'] ?? 'User Bio Data Read Failed';
        customErrorMessage(message: errorMessage);
        _setLoading(false);
      }
    } catch (error) {
      customErrorMessage(message: error.toString());
      _setLoading(false);
    }
  }
  void _setLoading(bool value) {
    isLoading = value;
    update();
  }
}
