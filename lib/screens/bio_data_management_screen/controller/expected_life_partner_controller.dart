import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/model/expected_life_partner.dart';
import 'package:islamic_marriage/screens/my_bio_data_screen/controller/my_bio_data_controller.dart';
import 'package:islamic_marriage/services/api_service.dart';
import 'package:islamic_marriage/utils/app_urls.dart';
import 'package:islamic_marriage/utils/app_constant_functions.dart';

class ExpectedLifePartnerController extends GetxController {
  bool isLoading = false;

  ExpectedLifePartner? expectedLifePartner;

  final formKey = GlobalKey<FormState>();
  List<int>? selectedAgeRange;
  List<String> selectedComplexion = [];
  final heightController = TextEditingController();
  final educationalQualificationController = TextEditingController();
  final districtController = TextEditingController();
  List<String> selectedMaritalStatus = [];
  final professionController = TextEditingController();
  final financialConditionController = TextEditingController();
  final expectedQualityController = TextEditingController();

  Future<bool> createExpectedLifePartner() async {
    isLoading = true;
    update();
    if (selectedComplexion.isEmpty || selectedMaritalStatus.isEmpty) {
      customErrorMessage(message: 'Please select at least one complexion & marital status');
      isLoading = false;
      update();
      return false;
    }
    try {
      final expectedLifePartner = ExpectedLifePartner(
          ageRange: selectedAgeRange,
          complexion: selectedComplexion,
          height: heightController.text,
          educationalQualification: educationalQualificationController.text,
          district: districtController.text,
          maritalStatus: selectedMaritalStatus,
          profession: professionController.text,
          financialCondition: financialConditionController.text,
          expectedQuality: expectedQualityController.text);
      final response = await ApiService().post(
          url: AppUrls.createExpectedLifePartnerInfoUrl,
          data: expectedLifePartner,
          headers: AppUrls.getHeaderWithToken);
      if (response.success) {
        customSuccessMessage(
            message: 'ExpectedLifePartner Created Successful');
        Get.find<MyBioDataController>().readMyBioData();
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

  Future<void> readExpectedLifePartner() async {
    isLoading = true;
    update();
    try {
      final response = await ApiService().get(
          url: AppUrls.readExpectedLifePartnerInfoUrl,
          headers: AppUrls.getHeaderWithToken);
      if (response.success) {
       expectedLifePartner = ExpectedLifePartner.fromJson(response.data['data']);
        isLoading = false;
        update();
      } else {
        final errorMessage = response.message['message'] ??
            'Expected Life Partner Read Failed';
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

  Future<bool> updateExpectedLifePartner() async {
    isLoading = true;
    update();
    if (selectedComplexion.isEmpty || selectedMaritalStatus.isEmpty) {
      customErrorMessage(message: 'Please select at least one complexion & marital status');
      isLoading = false;
      update();
      return false;
    }
    try {
      final expectedLifePartner = ExpectedLifePartner(
          ageRange: selectedAgeRange,
          complexion: selectedComplexion,
          height: heightController.text,
          educationalQualification: educationalQualificationController.text,
          district: districtController.text,
          maritalStatus: selectedMaritalStatus,
          profession: professionController.text,
          financialCondition: financialConditionController.text,
          expectedQuality: expectedQualityController.text);
      final response = await ApiService().put(
          url: AppUrls.updateExpectedLifePartnerUrl,
          data: expectedLifePartner,
          headers: AppUrls.getHeaderWithToken);
      if (response.success) {
        customSuccessMessage(
            message: 'ExpectedLifePartner Updated Successful');
        Get.find<MyBioDataController>().readMyBioData();
        isLoading = false;
        update();
        return true;
      } else {
        final errorMessage = response.message['message'] ??
            'Expected Life Partner Update Failed';
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
}
