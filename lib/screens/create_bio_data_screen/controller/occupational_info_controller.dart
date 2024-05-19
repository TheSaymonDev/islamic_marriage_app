import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage/screens/create_bio_data_screen/model/occupational_info.dart';
import 'package:islamic_marriage/services/api_service.dart';
import 'package:islamic_marriage/services/shared_preference_service.dart';
import 'package:islamic_marriage/utils/app_urls.dart';
import 'package:islamic_marriage/widgets/styles.dart';

class OccupationalInfoController extends GetxController {
  bool isLoading = false;

  OccupationalInfo? occupationalInfo;
  final formKey = GlobalKey<FormState>();

  String? selectedOccupation;
  final descriptionController = TextEditingController();
  final incomeController = TextEditingController();

  Future<bool> createOccupationalInfo() async {
    isLoading = true;
    update();
    try {
      final occupationalInfo = OccupationalInfo(
        occupation: selectedOccupation,
        description: descriptionController.text,
        monthlyIncome: incomeController.text
      );
      final response = await ApiService().post(
          url: AppUrls.createOccupationalInfoUrl,
          data: occupationalInfo,
          headers: AppUrls.getHeaderWithToken);
      if (response.success) {
        customSuccessMessage(message: 'Occupational Info Created Successful');
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

  Future<void> readOccupationalInfo() async {
    isLoading = true;
    update();
    try {
      final response = await ApiService().get(
          url: AppUrls.readOccupationalInfoUrl,
          headers: AppUrls.getHeaderWithToken);
      if (response.success) {
        occupationalInfo = OccupationalInfo.fromJson(response.data['data']);
        isLoading = false;
        update();
      } else {
        final errorMessage =
            response.message['message'] ?? 'Occupational Info Read Failed';
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

  Future<bool> updateOccupationalInfo() async {
    isLoading = true;
    update();
    try {
      final occupationalInfo = OccupationalInfo(
          occupation: selectedOccupation,
          description: descriptionController.text,
          monthlyIncome: incomeController.text
      );
      final response = await ApiService().put(
          url: AppUrls.updateOccupationalInfoUrl,
          data: occupationalInfo,
          headers: AppUrls.getHeaderWithToken);
      if (response.success) {
        customSuccessMessage(message: 'Occupational Info Updated Successful');
        isLoading = false;
        update();
        return true;
      } else {
        final errorMessage =
            response.message['message'] ?? 'Occupational Info Update Failed';
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
