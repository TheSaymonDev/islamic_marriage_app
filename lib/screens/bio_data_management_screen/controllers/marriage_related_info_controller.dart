import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/models/marriage_related_info.dart';
import 'package:islamic_marriage/screens/my_bio_data_screen/controllers/my_bio_data_controller.dart';
import 'package:islamic_marriage/services/api_service.dart';
import 'package:islamic_marriage/services/connectivity_service.dart';
import 'package:islamic_marriage/utils/app_urls.dart';
import 'package:islamic_marriage/utils/app_constant_functions.dart';

class MarriageRelatedInfoController extends GetxController {
  bool isLoading = false;

  //MarriageRelatedInfo? marriageRelatedInfo;

  final formKey = GlobalKey<FormState>();
  final guardiansAgreeController = TextEditingController();
  final veilController = TextEditingController();
  final afterStudyController = TextEditingController();
  final afterJobController = TextEditingController();
  final whereLiveController = TextEditingController();
  final giftController = TextEditingController();
  final getMarriedController = TextEditingController();

  Future<bool> upsertMarriageInfo() async {
    if (!await ConnectivityService.isConnected()) {
      customErrorMessage(message: 'Please check your internet connection');
      return false;
    }
    isLoading = true;
    update();
    try {
      final marriageInfo = MarriageRelatedInfo(
        guardianAgree: guardiansAgreeController.text,
        wifeInVeil: veilController.text,
        studyAfterMarriage: afterStudyController.text,
        jobAfterMarriage: afterJobController.text,
        livingPlaceAfterMarriage: whereLiveController.text,
        expectGiftFromBrideFamily: giftController.text,
        thoughtAboutMarriage: getMarriedController.text
      );
      final response = await ApiService().patch(
          url: AppUrls.upsertBioDataUrl,
          data: marriageInfo,
          headers: AppUrls.getHeaderWithToken);
      if (response.success) {
        customSuccessMessage(message: 'Marriage Related Info Created Successful');
        Get.find<MyBioDataController>().getCurrentUser();
        isLoading = false;
        update();
        return true;
      } else {
        final errorMessage =
            response.message['message'] ?? 'Marriage Related Info Create Failed';
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
