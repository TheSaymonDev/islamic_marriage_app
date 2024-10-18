import 'package:get/get.dart';
import 'package:islamic_marriage/screens/my_bio_data_screen/models/current_user.dart';
import 'package:islamic_marriage/services/api_service.dart';
import 'package:islamic_marriage/services/connectivity_service.dart';
import 'package:islamic_marriage/utils/app_urls.dart';
import 'package:islamic_marriage/utils/app_constant_functions.dart';

class MyBioDataController extends GetxController {
  bool isLoading = false;
  CurrentUser? currentUser;

  Future<void> getCurrentUser() async {
    if (!await ConnectivityService.isConnected()) {
      customErrorMessage(message: 'Please check your internet connection');
      return;
    }
    isLoading = true;
    update();
    try {
      final response = await ApiService().get(
          url: AppUrls.getCurrentUser,
          headers: AppUrls.getHeaderWithToken);
      if (response.success) {
        currentUser = CurrentUser.fromJson(response.data);
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
