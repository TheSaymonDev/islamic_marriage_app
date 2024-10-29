import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/controllers/current_user_biodata_controller.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/models/dropdown_item.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/models/expected_life_partner.dart';
import 'package:islamic_marriage/services/api_service.dart';
import 'package:islamic_marriage/services/connectivity_service.dart';
import 'package:islamic_marriage/utils/app_urls.dart';
import 'package:islamic_marriage/utils/app_constant_functions.dart';

class ExpectedLifePartnerController extends GetxController {
  bool isLoading = false;
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
    _setLoading(true);
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
      final Map<String, dynamic> data = {
        "expectedLifePartnerInfo": expectedLifePartner.toJson(),
      };
      final response = await ApiService().patch(
          url: AppUrls.upsertBioDataUrl,
          data: data,
          headers: AppUrls.getHeaderWithToken);
      if (response.success) {
        customSuccessMessage(message: 'ExpectedLifePartner Created Successful');
        Get.find<CurrentUserBioDataController>().getCurrentUserData();
        _setLoading(false);
        return true;
      } else {
        final errorMessage = response.message['message'] ??
            'Expected Life Partner Create Failed';
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
