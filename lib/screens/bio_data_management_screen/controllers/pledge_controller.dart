import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/models/dropdown_item.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/models/pledge.dart';
import 'package:islamic_marriage/screens/my_bio_data_screen/controllers/my_bio_data_controller.dart';
import 'package:islamic_marriage/services/api_service.dart';
import 'package:islamic_marriage/services/connectivity_service.dart';
import 'package:islamic_marriage/utils/app_urls.dart';
import 'package:islamic_marriage/utils/app_constant_functions.dart';

class PledgeController extends GetxController {
  bool isLoading = false;

  // Pledge? pledge;

  final formKey = GlobalKey<FormState>();
  DropdownItem? selectedParentalAwareness;
  DropdownItem? selectedInformationTruth;
  DropdownItem? selectedAgreement;

  Future<bool> upsertPledge() async {
    if (!await ConnectivityService.isConnected()) {
      customErrorMessage(message: 'Please check your internet connection');
      return false;
    }
    isLoading = true;
    update();
    try {
      final pledge = Pledge(
          parentalAwareness: selectedParentalAwareness!.value,
          informationTruth: selectedInformationTruth!.value,
          agreement: selectedAgreement!.value);
      final response = await ApiService().patch(
          url: AppUrls.upsertBioDataUrl,
          data: pledge,
          headers: AppUrls.getHeaderWithToken);
      if (response.success) {
        customSuccessMessage(message: 'Pledge Created Successful');
        Get.find<MyBioDataController>().getCurrentUser();
        isLoading = false;
        update();
        return true;
      } else {
        final errorMessage =
            response.message['message'] ?? 'Pledge Create Failed';
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

  // Future<void> readPledge() async {
  //   isLoading = true;
  //   update();
  //   try {
  //     final response = await ApiService()
  //         .get(url: AppUrls.readPledgeUrl, headers: AppUrls.getHeaderWithToken);
  //     if (response.success) {
  //       pledge = Pledge.fromJson(response.data['data']);
  //       isLoading = false;
  //       update();
  //     } else {
  //       final errorMessage =
  //           response.message['message'] ?? 'Pledge Read Failed';
  //       customErrorMessage(message: errorMessage);
  //       isLoading = false;
  //       update();
  //     }
  //   } catch (error) {
  //     customErrorMessage(message: error.toString());
  //     isLoading = false;
  //     update();
  //   }
  // }
  //
  // Future<bool> updatePledge() async {
  //   isLoading = true;
  //   update();
  //   try {
  //     final pledge = Pledge(
  //         parentKnowSubmission: selectedPledge1,
  //         isAllInfoTrue: selectedPledge2,
  //         falseInfoProven: selectedPledge3);
  //     final response = await ApiService().put(
  //         url: AppUrls.updatePledgeUrl,
  //         data: pledge,
  //         headers: AppUrls.getHeaderWithToken);
  //     if (response.success) {
  //       customSuccessMessage(message: 'Pledge Updated Successful');
  //       Get.find<MyBioDataController>().readMyBioData();
  //       isLoading = false;
  //       update();
  //       return true;
  //     } else {
  //       final errorMessage =
  //           response.message['message'] ?? 'Pledge Update Failed';
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
