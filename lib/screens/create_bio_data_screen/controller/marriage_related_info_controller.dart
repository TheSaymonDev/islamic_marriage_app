import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage/screens/create_bio_data_screen/model/marriage_info.dart';
import 'package:islamic_marriage/services/api_service.dart';
import 'package:islamic_marriage/utils/app_urls.dart';
import 'package:islamic_marriage/widgets/styles.dart';

class MarriageRelatedInfoController extends GetxController {
  bool isLoading = false;

  MarriageRelatedInfo? marriageRelatedInfo;
  final formKey = GlobalKey<FormState>();

  final guardiansAgreeController = TextEditingController();
  final veilController = TextEditingController();
  final afterStudyController = TextEditingController();
  final afterJobController = TextEditingController();
  final whereLiveController = TextEditingController();
  final giftController = TextEditingController();
  final getMarriedController = TextEditingController();

  Future<bool> createMarriageInfo() async {
    isLoading = true;
    update();
    try {
      final marriageInfo = MarriageRelatedInfo(
        guardiansPermission: guardiansAgreeController.text,
        veilAfterMarriage: veilController.text,
        partnerEducationPermission: afterStudyController.text,
        partnerJobPermission: afterJobController.text,
        liveInformationAfterMarriage: whereLiveController.text,
        expectedGift: giftController.text,
        thoughtAboutMarriage: getMarriedController.text
      );
      final response = await ApiService().post(
          url: AppUrls.createMarriageInfoUrl,
          data: marriageInfo,
          headers: AppUrls.getHeaderWithToken);
      if (response.success) {
        customSuccessMessage(message: 'Marriage Related Info Created Successful');
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

  Future<void> readMarriageInfo() async {
    isLoading = true;
    update();
    try {
      final response = await ApiService().get(
          url: AppUrls.readMarriageInfoUrl,
          headers: AppUrls.getHeaderWithToken);
      if (response.success) {
       marriageRelatedInfo = MarriageRelatedInfo.fromJson(response.data['data']);
        isLoading = false;
        update();
      } else {
        final errorMessage =
            response.message['message'] ?? 'Marriage Related Info Read Failed';
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

  Future<bool> updateMarriageInfo() async {
    isLoading = true;
    update();
    try {
      final marriageInfo = MarriageRelatedInfo(
          guardiansPermission: guardiansAgreeController.text,
          veilAfterMarriage: veilController.text,
          partnerEducationPermission: afterStudyController.text,
          partnerJobPermission: afterJobController.text,
          liveInformationAfterMarriage: whereLiveController.text,
          expectedGift: giftController.text,
          thoughtAboutMarriage: getMarriedController.text
      );
      final response = await ApiService().put(
          url: AppUrls.updateMarriageInfoUrl,
          data: marriageInfo,
          headers: AppUrls.getHeaderWithToken);
      if (response.success) {
        customSuccessMessage(message: 'Marriage Related Info Updated Successful');
        isLoading = false;
        update();
        return true;
      } else {
        final errorMessage =
            response.message['message'] ?? 'Marriage Related Info Update Failed';
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
