import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage/screens/create_bio_data_screen/model/edu_qualifications.dart';
import 'package:islamic_marriage/screens/my_bio_data_screen/controller/my_bio_data_controller.dart';
import 'package:islamic_marriage/services/api_service.dart';
import 'package:islamic_marriage/utils/app_urls.dart';
import 'package:islamic_marriage/widgets/styles.dart';

class EduQualificationsController extends GetxController {
  bool isLoading = false;

  EduQualifications? eduQualifications;

  final formKey = GlobalKey<FormState>();
  String? selectedEduMethod;
  String? selectedHighestEduQualification;
  final passingYearController = TextEditingController();
  String? selectedGroup;
  String? selectedResult;
  final institutionController = TextEditingController();
  final othersController = TextEditingController();
  String? selectedTitle;

  Future<bool> createEduQualification() async {
    isLoading = true;
    update();
    try {
      final eduQualification = EduQualifications(
          medium: selectedEduMethod,
          qualification: selectedHighestEduQualification,
          passingYear: passingYearController.text,
          category: selectedGroup,
          result: selectedResult,
          institution: institutionController.text,
          otherQualifications: othersController.text,
          religiousEducation: selectedTitle);
      final response = await ApiService().post(
          url: AppUrls.createEduQualificationUrl,
          data: eduQualification,
          headers: AppUrls.getHeaderWithToken);
      if (response.success) {
        customSuccessMessage(message: 'Edu Qualification Created Successful');
        Get.find<MyBioDataController>().readMyBioData();
        isLoading = false;
        update();
        return true;
      } else {
        final errorMessage =
            response.message['message'] ?? 'Edu Qualification Create Failed';
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

  Future<void> readEduQualification() async {
    isLoading = true;
    update();
    try {
      final response = await ApiService().get(
          url: AppUrls.readEduQualificationUrl,
          headers: AppUrls.getHeaderWithToken);
      if (response.success) {
        eduQualifications = EduQualifications.fromJson(response.data['data']);
        isLoading = false;
        update();
      } else {
        final errorMessage =
            response.message['message'] ?? 'Edu Qualification Read Failed';
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

  Future<bool> updateEduQualification() async {
    isLoading = true;
    update();
    try {
      final eduQualification = EduQualifications(
          medium: selectedEduMethod,
          qualification: selectedHighestEduQualification,
          passingYear: passingYearController.text,
          category: selectedGroup,
          result: selectedResult,
          institution: institutionController.text,
          otherQualifications: othersController.text,
          religiousEducation: selectedTitle);
      final response = await ApiService().put(
          url: AppUrls.updateEduQualificationUrl,
          data: eduQualification,
          headers: AppUrls.getHeaderWithToken);
      if (response.success) {
        customSuccessMessage(message: 'Edu Qualification Updated Successful');
        Get.find<MyBioDataController>().readMyBioData();
        isLoading = false;
        update();
        return true;
      } else {
        final errorMessage =
            response.message['message'] ?? 'Edu Qualification Update Failed';
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
