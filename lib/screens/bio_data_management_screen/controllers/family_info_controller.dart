import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/controllers/current_user_biodata_controller.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/models/dropdown_item.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/models/family_info_model.dart';
import 'package:islamic_marriage/services/api_service.dart';
import 'package:islamic_marriage/services/connectivity_service.dart';
import 'package:islamic_marriage/utils/app_urls.dart';
import 'package:islamic_marriage/utils/app_constant_functions.dart';

class FamilyInfoController extends GetxController {
  bool isLoading = false;
  final formKey = GlobalKey<FormState>();
  final fathersNameController = TextEditingController();
  DropdownItem? selectedFatherAlive;
  final fathersProfessionController = TextEditingController();

  final mothersNameController = TextEditingController();
  DropdownItem? selectedMotherAlive;
  final mothersProfessionController = TextEditingController();

  final brotherCountController = TextEditingController();
  final sisterCountController = TextEditingController();
  final sistersInfoController = TextEditingController();
  final brothersInfoController = TextEditingController();
  final professionOfUnclesController = TextEditingController();
  DropdownItem? selectedFamilyIncomeStatus;
  final religiousConditionController = TextEditingController();

  Future<bool> upsertFamilyInfo() async {
    if (!await ConnectivityService.isConnected()) {
      customErrorMessage(message: 'Please check your internet connection');
      return false;
    }
    _setLoading(true);
    try {
      final data = FamilyInfoModel(
        familyInfo: FamilyInfo(
            fatherName: fathersNameController.text,
            fatherAlive: selectedFatherAlive!.value,
            fatherOccupation: fathersProfessionController.text,
            motherName: mothersNameController.text,
            motherAlive: selectedMotherAlive!.value,
            motherOccupation: mothersProfessionController.text,
            brotherCount: brotherCountController.text,
            brothersInfo: brothersInfoController.text,
            sisterCount: sisterCountController.text,
            sistersInfo: sistersInfoController.text,
            uncleAuntOccuption: professionOfUnclesController.text,
            familyStatus: selectedFamilyIncomeStatus!.value,
            familyReligiousEnvironment: religiousConditionController.text),
      );
      final response = await ApiService().patch(
          url: AppUrls.upsertBioDataUrl,
          data: data,
          headers: AppUrls.getHeaderWithToken);
      if (response.success) {
        customSuccessMessage(message: 'Family Info Created Successful');
        Get.find<CurrentUserBioDataController>().getCurrentUserBioData();
        _setLoading(false);
        return true;
      } else {
        final errorMessage =
            response.message['message'] ?? 'Family Info Create Failed';
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
