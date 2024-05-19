import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage/screens/create_bio_data_screen/model/pledge.dart';
import 'package:islamic_marriage/services/api_service.dart';
import 'package:islamic_marriage/utils/app_urls.dart';
import 'package:islamic_marriage/widgets/styles.dart';

class PledgeController extends GetxController {
  bool isLoading = false;

  Pledge? pledge;

  final formKey = GlobalKey<FormState>();
  String? selectedPledge1;
  String? selectedPledge2;
  String? selectedPledge3;

  Future<bool> createPledge() async {
    isLoading = true;
    update();
    try {
      final pledge = Pledge(
          parentKnowSubmission: selectedPledge1,
          isAllInfoTrue: selectedPledge2,
          falseInfoProven: selectedPledge3);
      final response = await ApiService().post(
          url: AppUrls.createPledgeUrl,
          data: pledge,
          headers: AppUrls.getHeaderWithToken);
      if (response.success) {
        customSuccessMessage(message: 'Pledge Created Successful');
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

  Future<void> readPledge() async {
    isLoading = true;
    update();
    try {
      final response = await ApiService()
          .get(url: AppUrls.readPledgeUrl, headers: AppUrls.getHeaderWithToken);
      if (response.success) {
        pledge = Pledge.fromJson(response.data['data']);
        isLoading = false;
        update();
      } else {
        final errorMessage =
            response.message['message'] ?? 'Pledge Read Failed';
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

  Future<bool> updatePledge() async {
    isLoading = true;
    update();
    try {
      final pledge = Pledge(
          parentKnowSubmission: selectedPledge1,
          isAllInfoTrue: selectedPledge2,
          falseInfoProven: selectedPledge3);
      final response = await ApiService().put(
          url: AppUrls.updatePledgeUrl,
          data: pledge,
          headers: AppUrls.getHeaderWithToken);
      if (response.success) {
        customSuccessMessage(message: 'Pledge Updated Successful');
        isLoading = false;
        update();
        return true;
      } else {
        final errorMessage =
            response.message['message'] ?? 'Pledge Update Failed';
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
