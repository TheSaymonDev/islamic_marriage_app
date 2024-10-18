import 'package:get/get.dart';
import 'package:islamic_marriage/screens/explore_screens/models/all_user.dart';
import 'package:islamic_marriage/services/api_service.dart';
import 'package:islamic_marriage/services/connectivity_service.dart';
import 'package:islamic_marriage/utils/app_urls.dart';
import 'package:islamic_marriage/utils/app_constant_functions.dart';

class AllUserController extends GetxController {
  bool isLoading = false;
  AllUser? allUser;

  Future<void> getAllUser() async {
    if (!await ConnectivityService.isConnected()) {
      customErrorMessage(message: 'Please check your internet connection');
      return;
    }
    _setLoading(true);
    try {
      final response = await ApiService().get(
        url: '${AppUrls.getAllUser}?status=approved',
        headers: AppUrls.getHeaderWithToken,
      );

      if (response.success) {
        allUser = AllUser.fromJson(response.data);
        _setLoading(false);
      } else {
        final errorMessage =
            response.message['message'] ?? 'All Bio Data Read Failed';
        customErrorMessage(message: errorMessage);
        _setLoading(false);
      }
    } catch (error) {
      customErrorMessage(message: error);
      _setLoading(false);
    } finally {
      _setLoading(false);
    }
  }

  void _setLoading(bool state) {
    isLoading = state;
    update();
  }
}
