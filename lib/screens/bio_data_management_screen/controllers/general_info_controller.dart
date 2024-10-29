import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/controllers/current_user_biodata_controller.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/models/dropdown_item.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/models/general_info.dart';
import 'package:islamic_marriage/services/api_service.dart';
import 'package:islamic_marriage/services/connectivity_service.dart';
import 'package:islamic_marriage/utils/app_urls.dart';
import 'package:islamic_marriage/utils/app_constant_functions.dart';

class GeneralInfoController extends GetxController {

  bool isLoading = false;
  final formKey = GlobalKey<FormState>();
  DropdownItem? selectedBioDataType;
  DropdownItem? selectedMaritalStatus;
  DropdownItem? selectedHeight;
  DropdownItem? selectedWeight;
  DropdownItem? selectedComplexion;
  DropdownItem? selectedBloodGroup;
  DropdownItem? selectedNationality;
  final dateOfBirthController = TextEditingController();

  Future<bool> upsertGeneralInfo() async {
    if (!await ConnectivityService.isConnected()) {
      customErrorMessage(message: 'Please check your internet connection');
      return false;
    }
   _setLoading(true);
    try {
      final generalInfo = GeneralInfo(
          bioDataType: selectedBioDataType!.value,
          maritialStatus: selectedMaritalStatus!.value,
          height: selectedHeight!.value,
          weight: selectedWeight!.value,
          complexion: selectedComplexion!.value,
          bloodGroup: selectedBloodGroup!.value,
          nationality: selectedNationality!.value,
          dateOfBirth: dateOfBirthController.text);
      print(generalInfo.bioDataType);
      print(generalInfo.maritialStatus);
      print(generalInfo.height);
      print(generalInfo.weight);
      print(generalInfo.complexion);
      print(generalInfo.bloodGroup);
      print(generalInfo.nationality);
      print(generalInfo.dateOfBirth);
      final Map<String, dynamic> data = {
        "generalInfo": generalInfo.toJson(),
      };
      final response = await ApiService().patch(
          url: AppUrls.upsertBioDataUrl,
          data: data,
          headers: AppUrls.getHeaderWithToken);
      if (response.success) {
        customSuccessMessage(message: 'General Info Created Successful');
        Get.find<CurrentUserBioDataController>().getCurrentUserData();
      _setLoading(false);
        return true;
      } else {
        final errorMessage =
            response.message['message'] ?? 'General Info Create Failed';
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
