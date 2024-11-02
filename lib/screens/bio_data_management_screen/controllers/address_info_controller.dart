import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/controllers/current_user_biodata_controller.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/models/address_model.dart';
import 'package:islamic_marriage/services/api_service.dart';
import 'package:islamic_marriage/services/connectivity_service.dart';
import 'package:islamic_marriage/utils/app_urls.dart';
import 'package:islamic_marriage/utils/app_constant_functions.dart';

class AddressInfoController extends GetxController {
  bool isLoading = false;
  final formKey = GlobalKey<FormState>();

  final divisionController = TextEditingController();
  final districtController = TextEditingController();
  final subDistrictController = TextEditingController();
  final areaController = TextEditingController();

  final currentDivisionController = TextEditingController();
  final currentDistrictController = TextEditingController();
  final currentSubDistrictController = TextEditingController();
  final currentAreaController = TextEditingController();

  final growUpController = TextEditingController();
  bool isSameAsPermanent = false;

  Future<bool> upsertAddress() async {
    if (!await ConnectivityService.isConnected()) {
      customErrorMessage(message: 'Please check your internet connection');
      return false;
    }
    _setLoading(true);
    try {
      final data = AddressModel(
        permanentAddress: PermanentAddress(
          division: divisionController.text,
          district: districtController.text,
          subDistrict: subDistrictController.text,
          areaName: areaController.text,
        ),
        currentAddress: isSameAsPermanent ? CurrentAddress(
            currentDivision: divisionController.text,
            currentDistrict: districtController.text,
            currentSubDistrict: subDistrictController.text,
            areaName: areaController.text
        ): CurrentAddress(
            currentDivision: currentDivisionController.text,
            currentDistrict: currentDistrictController.text,
            currentSubDistrict: currentSubDistrictController.text,
            areaName: currentAreaController.text
        ),
        grewUp: growUpController.text
      );
      final response = await ApiService().patch(
          url: AppUrls.upsertBioDataUrl,
          data: data,
          headers: AppUrls.getHeaderWithToken);
      if (response.success) {
        customSuccessMessage(message: 'Address Info Created Successful');
        Get.find<CurrentUserBioDataController>().getCurrentUserBioData();
        _setLoading(false);
        return true;
      } else {
        final errorMessage =
            response.message['message'] ?? 'Address Create Failed';
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
