import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:islamic_marriage/screens/profile_update_screen/models/profile_update.dart';
import 'package:islamic_marriage/screens/sign_up_screen/model/gender.dart';
import 'package:islamic_marriage/services/api_service.dart';
import 'package:islamic_marriage/services/shared_preference_service.dart';
import 'package:islamic_marriage/utils/app_constant_functions.dart';
import 'package:islamic_marriage/utils/app_urls.dart';

class ProfileUpdateController extends GetxController{
bool isLoading = false;
  int currentGender = 0;

  List<Gender> gender = [
    Gender(title: 'Male', value: 'male'),
    Gender(title: 'Female', value: 'female')
  ];

  void selectGender(int index) {
    currentGender = index;
    update();
  }

  File? imageFile;
  Future<void> getImageFromGallery() async {
    final pickedImage =
    await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      imageFile = File(pickedImage.path);
    }
    update();
  }


  Future<bool> updateProfile({required ProfileUpdate profileUpdate}) async {
    isLoading = true;
    update();
    try {
      final response = await ApiService().post(
          url: AppUrls.profileUpdateUrl, data: profileUpdate, headers: AppUrls.getHeaderWithToken);
      if (response.success) {
        customSuccessMessage(message: 'Successfully Profile Update');
        isLoading = false;
        update();
        return true;
      } else {
        final errorMessage = response.message['message'] ?? 'Profile Update Failed';
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