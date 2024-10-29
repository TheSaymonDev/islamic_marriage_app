import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/controllers/current_user_biodata_controller.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/models/contact.dart';
import 'package:islamic_marriage/services/api_service.dart';
import 'package:islamic_marriage/services/connectivity_service.dart';
import 'package:islamic_marriage/utils/app_urls.dart';
import 'package:islamic_marriage/utils/app_constant_functions.dart';

class ContactController extends GetxController {
  bool isLoading = false;
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final guardiansMobileController = TextEditingController();
  final relationshipController = TextEditingController();
  final emailController = TextEditingController();

  Future<bool> upsertContact() async {
    if (!await ConnectivityService.isConnected()) {
      customErrorMessage(message: 'Please check your internet connection');
      return false;
    }
    _setLoading(true);
    try {
      final contact = Contact(
          groomName: nameController.text,
          guardianMobile: guardiansMobileController.text,
          relationShipWithGuardian: relationshipController.text,
          email: emailController.text);
      final Map<String, dynamic> data = {
        "contactInfo": contact.toJson(),
      };
      final response = await ApiService().patch(
          url: AppUrls.upsertBioDataUrl,
          data: data,
          headers: AppUrls.getHeaderWithToken);
      if (response.success) {
        customSuccessMessage(message: 'Contact Created Successful');
        Get.find<CurrentUserBioDataController>().getCurrentUserData();
        _setLoading(false);
        return true;
      } else {
        final errorMessage =
            response.message['message'] ?? 'Contact Create Failed';
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
