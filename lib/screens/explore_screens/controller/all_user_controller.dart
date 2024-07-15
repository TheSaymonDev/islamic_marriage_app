import 'package:get/get.dart';
import 'package:islamic_marriage/screens/explore_screens/model/all_user.dart';
import 'package:islamic_marriage/services/api_service.dart';
import 'package:islamic_marriage/utils/app_urls.dart';
import 'package:islamic_marriage/utils/app_constant_functions.dart';

class AllUserController extends GetxController {
  bool isLoading = false;
  AllUser? allUser;

  Future<void> getAllUser() async {
    _setLoadingState(true);
    try {
      final response = await ApiService().get(
        url: AppUrls.getAllUser,
        headers: AppUrls.getHeaderWithToken,
      );

      if (response.success) {
        allUser = AllUser.fromJson(response.data);
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
