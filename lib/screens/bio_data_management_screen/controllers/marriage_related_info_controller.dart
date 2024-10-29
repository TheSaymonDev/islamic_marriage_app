import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/controllers/current_user_biodata_controller.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/models/marriage_related_info.dart';
import 'package:islamic_marriage/services/api_service.dart';
import 'package:islamic_marriage/services/connectivity_service.dart';
import 'package:islamic_marriage/utils/app_urls.dart';
import 'package:islamic_marriage/utils/app_constant_functions.dart';

class MarriageRelatedInfoController extends GetxController {
  bool isLoading = false;
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
    _setLoading(true);
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
      final Map<String, dynamic> data = {
        "marriageInfo": marriageInfo.toJson(),
      };
      final response = await ApiService().patch(
          url: AppUrls.upsertBioDataUrl,
          data: data,
          headers: AppUrls.getHeaderWithToken);
      if (response.success) {
        customSuccessMessage(message: 'Marriage Related Info Created Successful');
        Get.find<CurrentUserBioDataController>().getCurrentUserData();
       _setLoading(false);
        return true;
      } else {
        final errorMessage =
            response.message['message'] ?? 'Marriage Related Info Create Failed';
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
