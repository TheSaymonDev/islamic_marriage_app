import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage/screens/create_bio_data_screen/model/family_info.dart';
import 'package:islamic_marriage/screens/my_bio_data_screen/controller/my_bio_data_controller.dart';
import 'package:islamic_marriage/services/api_service.dart';
import 'package:islamic_marriage/utils/app_urls.dart';
import 'package:islamic_marriage/widgets/styles.dart';

class FamilyInfoController extends GetxController {
  bool isLoading = false;

  FamilyInfo? familyInfo;
  final formKey = GlobalKey<FormState>();

  final fathersNameController = TextEditingController();
  String? selectedFatherAlive;
  final fathersProfessionController = TextEditingController();

  final mothersNameController = TextEditingController();
  String? selectedMotherAlive;
  final mothersProfessionController = TextEditingController();

  String? selectedBrotherCount;
  String? selectedSisterCount;
  final sistersInfoController = TextEditingController();
  final brothersInfoController = TextEditingController();
  final professionOfUnclesController = TextEditingController();
  final descriptionOfFinancialConditionController = TextEditingController();
  final religiousConditionController = TextEditingController();

  Future<bool> createFamilyInfo() async {
    isLoading = true;
    update();
    try {
      final familyInfo = FamilyInfo(
        fatherName: fathersNameController.text,
        isFatherAlive: selectedFatherAlive,
        fatherOccupation: fathersProfessionController.text,
        motherName: mothersNameController.text,
        isMotherAlive: selectedMotherAlive,
        motherOccupation: mothersProfessionController.text,
        brothersCount: selectedBrotherCount,
        brotherInformation: brothersInfoController.text,
        sistersCount: sistersInfoController.text,
        sisterInformation: sistersInfoController.text,
        occupationOfUnclesAndAunts: professionOfUnclesController.text,
        familyIncome: descriptionOfFinancialConditionController.text,
        familyReligionEnvironment: religiousConditionController.text,
      );
      final response = await ApiService().post(
          url: AppUrls.createFamilyInfoUrl,
          data: familyInfo,
          headers: AppUrls.getHeaderWithToken);
      if (response.success) {
        customSuccessMessage(message: 'Family Info Created Successful');
        Get.find<MyBioDataController>().readMyBioData();
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

  Future<void> readFamilyInfo() async {
    isLoading = true;
    update();
    try {
      final response = await ApiService().get(
          url: AppUrls.readFamilyInfoUrl,
          headers: AppUrls.getHeaderWithToken);
      if (response.success) {
        familyInfo = FamilyInfo.fromJson(response.data['data']);
        isLoading = false;
        update();
      } else {
        final errorMessage =
            response.message['message'] ?? 'Family Info Read Failed';
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

  Future<bool> updateFamilyInfo() async {
    isLoading = true;
    update();
    try {
      final familyInfo = FamilyInfo(
        fatherName: fathersNameController.text,
        isFatherAlive: selectedFatherAlive,
        fatherOccupation: fathersProfessionController.text,
        motherName: mothersNameController.text,
        isMotherAlive: selectedMotherAlive,
        motherOccupation: mothersProfessionController.text,
        brothersCount: selectedBrotherCount,
        brotherInformation: brothersInfoController.text,
        sistersCount: sistersInfoController.text,
        sisterInformation: sistersInfoController.text,
        occupationOfUnclesAndAunts: professionOfUnclesController.text,
        familyIncome: descriptionOfFinancialConditionController.text,
        familyReligionEnvironment: religiousConditionController.text,
      );
      final response = await ApiService().put(
          url: AppUrls.updateFamilyInfoUrl,
          data: familyInfo,
          headers: AppUrls.getHeaderWithToken);
      if (response.success) {
        customSuccessMessage(message: 'Family Info Updated Successful');
        Get.find<MyBioDataController>().readMyBioData();
        isLoading = false;
        update();
        return true;
      } else {
        final errorMessage =
            response.message['message'] ?? 'Family Info Update Failed';
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
