import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage/screens/create_bio_data_screen/model/contact.dart';
import 'package:islamic_marriage/screens/my_bio_data_screen/controller/my_bio_data_controller.dart';
import 'package:islamic_marriage/services/api_service.dart';
import 'package:islamic_marriage/utils/app_urls.dart';
import 'package:islamic_marriage/widgets/styles.dart';

class ContactController extends GetxController {
  bool isLoading = false;

  Contact? contact;

  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final guardiansMobileController = TextEditingController();
  final relationshipController = TextEditingController();
  final emailController = TextEditingController();

  Future<bool> createContact() async {
    isLoading = true;
    update();
    try {
      final contact = Contact(
          groomName: nameController.text,
          guardianMobile: guardiansMobileController.text,
          guardianRelationship: relationshipController.text,
          email: emailController.text);
      final response = await ApiService().post(
          url: AppUrls.createContactUrl,
          data: contact,
          headers: AppUrls.getHeaderWithToken);
      if (response.success) {
        customSuccessMessage(message: 'Contact Created Successful');
        Get.find<MyBioDataController>().readMyBioData();
        isLoading = false;
        update();
        return true;
      } else {
        final errorMessage =
            response.message['message'] ?? 'Contact Create Failed';
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

  Future<void> readContact() async {
    isLoading = true;
    update();
    try {
      final response = await ApiService().get(
          url: AppUrls.readContactUrl, headers: AppUrls.getHeaderWithToken);
      if (response.success) {
        contact = Contact.fromJson(response.data['data']);
        isLoading = false;
        update();
      } else {
        final errorMessage =
            response.message['message'] ?? 'Contact Read Failed';
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

  Future<bool> updateContact() async {
    isLoading = true;
    update();
    try {
      final contact = Contact(
          groomName: nameController.text,
          guardianMobile: guardiansMobileController.text,
          guardianRelationship: guardiansMobileController.text,
          email: emailController.text);
      final response = await ApiService().put(
          url: AppUrls.updateContactUrl,
          data: contact,
          headers: AppUrls.getHeaderWithToken);
      if (response.success) {
        customSuccessMessage(message: 'Contact Updated Successful');
        Get.find<MyBioDataController>().readMyBioData();
        isLoading = false;
        update();
        return true;
      } else {
        final errorMessage =
            response.message['message'] ?? 'Contact Update Failed';
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
