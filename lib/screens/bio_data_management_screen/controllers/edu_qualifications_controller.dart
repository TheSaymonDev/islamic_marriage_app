import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/controllers/current_user_biodata_controller.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/models/dropdown_item.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/models/edu_qualifications_info.dart';
import 'package:islamic_marriage/services/api_service.dart';
import 'package:islamic_marriage/services/connectivity_service.dart';
import 'package:islamic_marriage/utils/app_urls.dart';
import 'package:islamic_marriage/utils/app_constant_functions.dart';

class EduQualificationsController extends GetxController {
  bool isLoading = false;
  final formKey = GlobalKey<FormState>();
  DropdownItem? selectedEduMethod;
  DropdownItem? selectedHighestEduQualification;
  final passingYearController = TextEditingController();
  //DropdownItem? selectedGroup;
  DropdownItem? selectedResult;
  final institutionController = TextEditingController();
  final othersController = TextEditingController();
  final religiousEduController = TextEditingController();

  Future<bool> upsertEduInfo() async {
    if (!await ConnectivityService.isConnected()) {
      customErrorMessage(message: 'Please check your internet connection');
      return false;
    }
    _setLoading(true);
    try {
      final eduInfo = EduQualificationsInfo(
          educationMethod: selectedEduMethod!.value,
          highestEducation: selectedHighestEduQualification!.value,
          passingYear: passingYearController.text,
          result: selectedResult!.value,
          institutionName: institutionController.text,
          otherEducation: othersController.text,
          religiousEducation: religiousEduController.text,
          );
      print(eduInfo.educationMethod);
      print(eduInfo.highestEducation);
      print(eduInfo.passingYear);
      print(eduInfo.result);
      print(eduInfo.institutionName);
      print(eduInfo.otherEducation);
      print(eduInfo.religiousEducation);
      final Map<String, dynamic> data = {
        "educationInfo": eduInfo.toJson(),
      };
      final response = await ApiService().patch(
          url: AppUrls.upsertBioDataUrl,
          data: data,
          headers: AppUrls.getHeaderWithToken);
      if (response.success) {
        customSuccessMessage(message: 'Edu Info Created Successful');
        Get.find<CurrentUserBioDataController>().getCurrentUserData();
        _setLoading(false);
        return true;
      } else {
        final errorMessage =
            response.message['message'] ?? 'Edu Info Create Failed';
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
