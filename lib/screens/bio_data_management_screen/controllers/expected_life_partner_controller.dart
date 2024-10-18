import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/models/dropdown_item.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/models/expected_life_partner.dart';
import 'package:islamic_marriage/screens/my_bio_data_screen/controllers/my_bio_data_controller.dart';
import 'package:islamic_marriage/services/api_service.dart';
import 'package:islamic_marriage/services/connectivity_service.dart';
import 'package:islamic_marriage/utils/app_urls.dart';
import 'package:islamic_marriage/utils/app_constant_functions.dart';

class ExpectedLifePartnerController extends GetxController {
  bool isLoading = false;

  //ExpectedLifePartner? expectedLifePartner;

  final formKey = GlobalKey<FormState>();
  int? expectedMinAge;
  int? expectedMaxAge;
  final expectedHeight = TextEditingController();
  DropdownItem? expectedComplexion;
  final expectedEducation = TextEditingController();
  final expectedDistrict = TextEditingController();
  DropdownItem? expectedMaritalStatus;
  final expectedProfession = TextEditingController();
  final expectedFinancialCondition = TextEditingController();
  final expectedQualityAttributes = TextEditingController();

  Future<bool> upsertExpectedLifePartner() async {
    if (!await ConnectivityService.isConnected()) {
      customErrorMessage(message: 'Please check your internet connection');
      return false;
    }
    isLoading = true;
    update();
    try {
      final expectedLifePartner = ExpectedLifePartner(
        // expectedMinAge: expectedMinAge,
        // expectedMaxAge: expectedMaxAge,
        expectedHeight: expectedHeight.text,
        expectedComplexion: expectedComplexion!.value,
        exptectedEducation: expectedEducation.text,
        exptectedDistrict: expectedDistrict.text,
        expectedMaritialStatus: expectedMaritalStatus!.value,
        expectedProfession: expectedProfession.text,
        expectedFinancialCondition: expectedFinancialCondition.text,
        expectedAttributes: expectedQualityAttributes.text,
      );
      print(expectedLifePartner.expectedMinAge);
      print(expectedLifePartner.expectedMaxAge);
      print(expectedLifePartner.expectedHeight);
      print(expectedLifePartner.expectedComplexion);
      print(expectedLifePartner.exptectedEducation);
      print(expectedLifePartner.exptectedDistrict);
      print(expectedLifePartner.expectedMaritialStatus);
      print(expectedLifePartner.expectedProfession);
      print(expectedLifePartner.expectedFinancialCondition);
      print(expectedLifePartner.expectedAttributes);
      final response = await ApiService().patch(
          url: AppUrls.upsertBioDataUrl,
          data: expectedLifePartner,
          headers: AppUrls.getHeaderWithToken);
      if (response.success) {
        customSuccessMessage(message: 'ExpectedLifePartner Created Successful');
        Get.find<MyBioDataController>().getCurrentUser();
        isLoading = false;
        update();
        return true;
      } else {
        final errorMessage = response.message['message'] ??
            'Expected Life Partner Create Failed';
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

  // Future<void> readExpectedLifePartner() async {
  //   isLoading = true;
  //   update();
  //   try {
  //     final response = await ApiService().get(
  //         url: AppUrls.readExpectedLifePartnerInfoUrl,
  //         headers: AppUrls.getHeaderWithToken);
  //     if (response.success) {
  //      expectedLifePartner = ExpectedLifePartner.fromJson(response.data['data']);
  //       isLoading = false;
  //       update();
  //     } else {
  //       final errorMessage = response.message['message'] ??
  //           'Expected Life Partner Read Failed';
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
  // Future<bool> updateExpectedLifePartner() async {
  //   isLoading = true;
  //   update();
  //   if (selectedComplexion.isEmpty || selectedMaritalStatus.isEmpty) {
  //     customErrorMessage(message: 'Please select at least one complexion & marital status');
  //     isLoading = false;
  //     update();
  //     return false;
  //   }
  //   try {
  //     final expectedLifePartner = ExpectedLifePartner(
  //         ageRange: selectedAgeRange,
  //         complexion: selectedComplexion,
  //         height: heightController.text,
  //         educationalQualification: educationalQualificationController.text,
  //         district: districtController.text,
  //         maritalStatus: selectedMaritalStatus,
  //         profession: professionController.text,
  //         financialCondition: financialConditionController.text,
  //         expectedQuality: expectedQualityController.text);
  //     final response = await ApiService().put(
  //         url: AppUrls.updateExpectedLifePartnerUrl,
  //         data: expectedLifePartner,
  //         headers: AppUrls.getHeaderWithToken);
  //     if (response.success) {
  //       customSuccessMessage(
  //           message: 'ExpectedLifePartner Updated Successful');
  //       Get.find<MyBioDataController>().readMyBioData();
  //       isLoading = false;
  //       update();
  //       return true;
  //     } else {
  //       final errorMessage = response.message['message'] ??
  //           'Expected Life Partner Update Failed';
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
