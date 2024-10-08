import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:islamic_marriage/screens/profile_update_screen/models/profile_update.dart';
import 'package:islamic_marriage/screens/sign_up_screen/model/gender.dart';
import 'package:islamic_marriage/services/api_service.dart';
import 'package:islamic_marriage/services/connectivity_service.dart';
import 'package:islamic_marriage/utils/app_constant_functions.dart';
import 'package:islamic_marriage/utils/app_urls.dart';

class ProfileUpdateController extends GetxController {
  bool isLoading = false;
  ProfileUpdate? profileInfo;

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  int currentGender = 0;

  List<Gender> gender = [
    Gender(title: 'male', value: 'male'),
    Gender(title: 'female', value: 'female')
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

  @override
  void onInit() {
    super.onInit();
    getProfileInfo();
  }

  Future<void> getProfileInfo() async {
    if (!await ConnectivityService.isConnected()) {
      customErrorMessage(message: 'Please check your internet connection');
      return;
    }
    _setLoading(true);
    try {
      final response = await ApiService().get(
          url: AppUrls.getCurrentUser,
          headers: AppUrls.getHeaderWithToken);
      if (response.success) {
        profileInfo = ProfileUpdate.fromJson(response.data['data']);
        _assignProfileData();
       _setLoading(false);
      } else {
        final errorMessage =
            response.message['message'] ?? 'User Info Read Failed';
        customErrorMessage(message: errorMessage);
       _setLoading(false);
      }
    } catch (error) {
      customErrorMessage(message: error.toString());
     _setLoading(false);
    }
  }

  Future<bool> updateProfile({required ProfileUpdate profileUpdate}) async {
    _setLoading(true);
    try {
      final response = await ApiService().patch(
          url: AppUrls.profileUpdateUrl,
          data: profileUpdate,
          headers: AppUrls.getHeaderWithToken);
      if (response.success) {
        customSuccessMessage(message: 'Successfully Profile Update');
        _setLoading(false);
        return true;
      } else {
        final errorMessage =
            response.message['message'] ?? 'Profile Update Failed';
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

  void _assignProfileData() {
    nameController.text = profileInfo?.name ?? '';
    phoneController.text = profileInfo?.phone ?? '';
    emailController.text = profileInfo?.email ?? '';
    update();
  }

  void _setLoading(bool value) {
    isLoading = value;
    update();
  }
}
