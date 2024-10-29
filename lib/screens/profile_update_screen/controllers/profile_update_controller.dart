import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:islamic_marriage/screens/profile_update_screen/models/gender_model.dart';
import 'package:islamic_marriage/screens/profile_update_screen/models/profile_data_model.dart';
import 'package:islamic_marriage/screens/profile_update_screen/models/profile_update_model.dart';
import 'package:islamic_marriage/services/api_service.dart';
import 'package:islamic_marriage/services/connectivity_service.dart';
import 'package:islamic_marriage/utils/app_constant_functions.dart';
import 'package:islamic_marriage/utils/app_urls.dart';

class ProfileUpdateController extends GetxController {
  bool isLoading = false;

  ProfileDataModel? profileData;
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  String? imgUrl;
  final List<GenderModel> gender = [
    GenderModel(title: 'male'.tr, value: 'male'),
    GenderModel(title: 'female'.tr, value: 'female')
  ];
  int currentGender = 0;
  void genderSelection(int index) {
    currentGender = index;
    update();
  }

  File? imageFile;
  Future<void> getImageFromGallery() async {
    try {
      final pickedImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedImage != null) {
        imageFile = File(pickedImage.path);
      } else {
        customErrorMessage(message: 'No image selected.');
      }
      update();
    } catch (error) {
      customErrorMessage(message: 'Failed to pick image.');
    }
  }

  Future<void> getProfileInfo() async {
    if (!await ConnectivityService.isConnected()) {
      customErrorMessage(message: 'Please check your internet connection');
      return;
    }
    _setLoading(true);
    try {
      final response = await ApiService().get(
          url: AppUrls.getCurrentUser, headers: AppUrls.getHeaderWithToken);
      if (response.success) {
        profileData = ProfileDataModel.fromJson(response.data['data']);
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

  Future<bool> updateProfile(
      {required ProfileUpdateModel profileUpdateData}) async {
    _setLoading(true);
    final data = {
      'name': profileUpdateData.name,
      'gender': profileUpdateData.gender,
    };
    try {
      final response = await ApiService().patchMultipart(
          url: AppUrls.profileUpdateUrl,
          data: data,
          file: imageFile,
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
    nameController.text = profileData?.name ?? '';
    phoneController.text = profileData?.phone ?? '';
    emailController.text = profileData?.email ?? '';
    imgUrl = profileData?.profileImage;

    // Assign gender based on profile data (handling null case)
    if (profileData?.gender != null) {
      currentGender = gender.indexWhere((g) => g.value == profileData!.gender);
      // যদি `indexWhere` কিছু না পায় তবে এটি -1 ফেরত দিবে, সেক্ষেত্রে `currentGender`কে ডিফল্ট ভ্যালু দিন
      currentGender = currentGender != -1 ? currentGender : 0;
    } else {
      currentGender = 0; // ডিফল্টভাবে male (বা female) সিলেক্ট করুন
    }
  }


  void _setLoading(bool value) {
    isLoading = value;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    getProfileInfo();
  }
}
