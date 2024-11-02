import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/controllers/current_user_biodata_controller.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/models/occupational_info_model.dart';
import 'package:islamic_marriage/services/api_service.dart';
import 'package:islamic_marriage/services/connectivity_service.dart';
import 'package:islamic_marriage/utils/app_urls.dart';
import 'package:islamic_marriage/utils/app_constant_functions.dart';

class OccupationalInfoController extends GetxController {
  bool isLoading = false;
  final formKey = GlobalKey<FormState>();
  final occupationController = TextEditingController();
  final descriptionController = TextEditingController();
  final incomeController = TextEditingController();

  Future<bool> upsertOccupationalInfo() async {
    if (!await ConnectivityService.isConnected()) {
      customErrorMessage(message: 'Please check your internet connection');
      return false;
    }
    _setLoading(true);
    try {
      final data = OccupationalInfoModel(
        occupationInfo: OccupationInfo(
            occupation: occupationController.text,
            descriptionOfProfession: descriptionController.text,
            monthlyIncome: incomeController.text),
      );
      final response = await ApiService().patch(
          url: AppUrls.upsertBioDataUrl,
          data: data,
          headers: AppUrls.getHeaderWithToken);
      if (response.success) {
        customSuccessMessage(message: 'Occupational Info Created Successful');
        Get.find<CurrentUserBioDataController>().getCurrentUserBioData();
        _setLoading(false);
        return true;
      } else {
        final errorMessage =
            response.message['message'] ?? 'Occupational Info Create Failed';
        customErrorMessage(message: errorMessage);
        _setLoading(false);
        return false;
      }
    } catch (error) {
      customErrorMessage(message: error.toString());
      _setLoading(false);
      return false;
    }
  }

  void _setLoading(bool value) {
    isLoading = value;
    update();
  }
}
