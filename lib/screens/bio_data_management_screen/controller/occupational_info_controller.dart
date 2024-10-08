import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/model/occupational_info.dart';
import 'package:islamic_marriage/screens/my_bio_data_screen/controller/my_bio_data_controller.dart';
import 'package:islamic_marriage/services/api_service.dart';
import 'package:islamic_marriage/services/connectivity_service.dart';
import 'package:islamic_marriage/utils/app_urls.dart';
import 'package:islamic_marriage/utils/app_constant_functions.dart';

class OccupationalInfoController extends GetxController {
  bool isLoading = false;

  //OccupationalInfo? occupationalInfo;
  final formKey = GlobalKey<FormState>();
  final occupationController = TextEditingController();
  final descriptionController = TextEditingController();
  final incomeController = TextEditingController();

  Future<bool> upsertOccupationalInfo() async {
    if (!await ConnectivityService.isConnected()) {
      customErrorMessage(message: 'Please check your internet connection');
      return false;
    }
    isLoading = true;
    update();
    try {
      final occupationalInfo = OccupationalInfo(
        occupation: occupationController.text,
        descriptionOfProfession: descriptionController.text,
        monthlyIncome: incomeController.text
      );
      final response = await ApiService().patch(
          url: AppUrls.upsertBioDataUrl,
          data: occupationalInfo,
          headers: AppUrls.getHeaderWithToken);
      if (response.success) {
        customSuccessMessage(message: 'Occupational Info Created Successful');
        Get.find<MyBioDataController>().getCurrentUser();
        isLoading = false;
        update();
        return true;
      } else {
        final errorMessage =
            response.message['message'] ?? 'Occupational Info Create Failed';
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

  // Future<void> readOccupationalInfo() async {
  //   isLoading = true;
  //   update();
  //   try {
  //     final response = await ApiService().get(
  //         url: AppUrls.readOccupationalInfoUrl,
  //         headers: AppUrls.getHeaderWithToken);
  //     if (response.success) {
  //       occupationalInfo = OccupationalInfo.fromJson(response.data['data']);
  //       isLoading = false;
  //       update();
  //     } else {
  //       final errorMessage =
  //           response.message['message'] ?? 'Occupational Info Read Failed';
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
  // Future<bool> updateOccupationalInfo() async {
  //   isLoading = true;
  //   update();
  //   try {
  //     final occupationalInfo = OccupationalInfo(
  //         occupation: selectedOccupation,
  //         description: descriptionController.text,
  //         monthlyIncome: incomeController.text
  //     );
  //     final response = await ApiService().put(
  //         url: AppUrls.updateOccupationalInfoUrl,
  //         data: occupationalInfo,
  //         headers: AppUrls.getHeaderWithToken);
  //     if (response.success) {
  //       customSuccessMessage(message: 'Occupational Info Updated Successful');
  //       Get.find<MyBioDataController>().readMyBioData();
  //       isLoading = false;
  //       update();
  //       return true;
  //     } else {
  //       final errorMessage =
  //           response.message['message'] ?? 'Occupational Info Update Failed';
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
