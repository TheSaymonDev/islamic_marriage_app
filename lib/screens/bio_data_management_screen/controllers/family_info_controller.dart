import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/models/dropdown_item.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/models/family_info.dart';
import 'package:islamic_marriage/screens/my_bio_data_screen/controllers/my_bio_data_controller.dart';
import 'package:islamic_marriage/services/api_service.dart';
import 'package:islamic_marriage/services/connectivity_service.dart';
import 'package:islamic_marriage/utils/app_urls.dart';
import 'package:islamic_marriage/utils/app_constant_functions.dart';

class FamilyInfoController extends GetxController {
  bool isLoading = false;

  FamilyInfo? familyInfo;
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
    isLoading = true;
    update();
    try {
      final familyInfo = FamilyInfo(
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
          familyRelagiousEnvironment: religiousConditionController.text);
      print(familyInfo.fatherName);
      print(familyInfo.fatherAlive);
      print(familyInfo.fatherOccupation);
      print(familyInfo.motherName);
      print(familyInfo.motherAlive);
      print(familyInfo.motherOccupation);
      print(familyInfo.brotherCount);
      print(familyInfo.sisterCount);
      print(familyInfo.brothersInfo);
      print(familyInfo.sistersInfo);
      print(familyInfo.uncleAuntOccuption);
      print(familyInfo.familyStatus);
      print(familyInfo.familyRelagiousEnvironment);
      final response = await ApiService().patch(
          url: AppUrls.upsertBioDataUrl,
          data: familyInfo,
          headers: AppUrls.getHeaderWithToken);
      if (response.success) {
        customSuccessMessage(message: 'Family Info Created Successful');
        Get.find<MyBioDataController>().getCurrentUser();
        isLoading = false;
        update();
        return true;
      } else {
        final errorMessage =
            response.message['message'] ?? 'Family Info Create Failed';
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

  // Future<void> readFamilyInfo() async {
  //   isLoading = true;
  //   update();
  //   try {
  //     final response = await ApiService().get(
  //         url: AppUrls.readFamilyInfoUrl,
  //         headers: AppUrls.getHeaderWithToken);
  //     if (response.success) {
  //       familyInfo = FamilyInfo.fromJson(response.data['data']);
  //       isLoading = false;
  //       update();
  //     } else {
  //       final errorMessage =
  //           response.message['message'] ?? 'Family Info Read Failed';
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
  // Future<bool> updateFamilyInfo() async {
  //   isLoading = true;
  //   update();
  //   try {
  //     final familyInfo = FamilyInfo(
  //       fatherName: fathersNameController.text,
  //       isFatherAlive: selectedFatherAlive,
  //       fatherOccupation: fathersProfessionController.text,
  //       motherName: mothersNameController.text,
  //       isMotherAlive: selectedMotherAlive,
  //       motherOccupation: mothersProfessionController.text,
  //       brothersCount: selectedBrotherCount,
  //       brotherInformation: brothersInfoController.text,
  //       sistersCount: selectedSisterCount,
  //       sisterInformation: sistersInfoController.text,
  //       occupationOfUnclesAndAunts: professionOfUnclesController.text,
  //       familyIncome: descriptionOfFinancialConditionController.text,
  //       familyReligionEnvironment: religiousConditionController.text,
  //     );
  //     final response = await ApiService().put(
  //         url: AppUrls.updateFamilyInfoUrl,
  //         data: familyInfo,
  //         headers: AppUrls.getHeaderWithToken);
  //     if (response.success) {
  //       customSuccessMessage(message: 'Family Info Updated Successful');
  //       Get.find<MyBioDataController>().readMyBioData();
  //       isLoading = false;
  //       update();
  //       return true;
  //     } else {
  //       final errorMessage =
  //           response.message['message'] ?? 'Family Info Update Failed';
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
