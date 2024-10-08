import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/model/dropdown_item.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/model/general_info.dart';
import 'package:islamic_marriage/screens/my_bio_data_screen/controller/my_bio_data_controller.dart';
import 'package:islamic_marriage/services/api_service.dart';
import 'package:islamic_marriage/services/connectivity_service.dart';
import 'package:islamic_marriage/utils/app_urls.dart';
import 'package:islamic_marriage/utils/app_constant_functions.dart';

class GeneralInfoController extends GetxController {
  bool isLoading = false;

  GeneralInfo? generalInfo;

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
    isLoading = true;
    update();
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
      final response = await ApiService().patch(
          url: AppUrls.upsertBioDataUrl,
          data: generalInfo,
          headers: AppUrls.getHeaderWithToken);
      if (response.success) {
        customSuccessMessage(message: 'General Info Created Successful');
        Get.find<MyBioDataController>().getCurrentUser();
        isLoading = false;
        update();
        return true;
      } else {
        final errorMessage =
            response.message['message'] ?? 'General Info Create Failed';
        customErrorMessage(message: errorMessage);
        isLoading = false;
        update();
        return false;
      }
    } catch (error) {
      customErrorMessage(message: error.toString());
      isLoading = false;
      update();
      return false;
    }
  }

  // Future<void> readGeneralInfo({required String id}) async {
  //   try {
  //     final response = await ApiService().get(
  //         url: AppUrls.readGeneralInfoUrl, headers: AppUrls.getHeaderWithToken);
  //     if (response.success) {
  //       generalInfo = GeneralInfo.fromJson(response.data['data']);
  //       update();
  //     } else {
  //       final errorMessage =
  //           response.message['message'] ?? 'General Info Read Failed';
  //       customErrorMessage(message: errorMessage);
  //       update();
  //     }
  //   } catch (error) {
  //     customErrorMessage(message: error.toString());
  //     update();
  //   }
  // }
  //
  // Future<bool> updateGeneralInfo() async {
  //   isLoading = true;
  //   update();
  //   try {
  //     final generalInfo = GeneralInfo(
  //         typeOfBiodata: selectedBioDataType,
  //         maritalStatus: selectedMaritalStatus,
  //         height: selectedHeight,
  //         weight: selectedWeight,
  //         complexion: selectedComplexion,
  //         bloodGroup: selectedBloodGroup,
  //         nationality: selectedNationality,
  //         dateOfBirth: dateOfBirthController.text);
  //     final response = await ApiService().put(
  //         url: AppUrls.updateGeneralInfoUrl,
  //         data: generalInfo,
  //         headers: AppUrls.getHeaderWithToken);
  //     if (response.success) {
  //       customSuccessMessage(message: 'General Info Update Successful');
  //       Get.find<MyBioDataController>().readMyBioData();
  //       // String id = response.data['data']['id'];
  //       // readGeneralInfo(id: id);
  //       isLoading = false;
  //       update();
  //       return true;
  //     } else {
  //       final errorMessage =
  //           response.message['message'] ?? 'General Info Update Failed';
  //       customErrorMessage(message: errorMessage);
  //       isLoading = false;
  //       update();
  //       return false;
  //     }
  //   } catch (error) {
  //     customErrorMessage(message: error.toString());
  //     isLoading = false;
  //     update();
  //     return false;
  //   }
  // }
}
