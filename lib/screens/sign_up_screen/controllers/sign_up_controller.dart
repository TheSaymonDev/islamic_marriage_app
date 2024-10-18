import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage/screens/sign_up_screen/models/gender_model.dart';
import 'package:islamic_marriage/screens/sign_up_screen/models/sign_up_model.dart';
import 'package:islamic_marriage/services/api_service.dart';
import 'package:islamic_marriage/services/connectivity_service.dart';
import 'package:islamic_marriage/utils/app_urls.dart';
import 'package:islamic_marriage/utils/app_constant_functions.dart';
import 'package:url_launcher/url_launcher.dart';

class SignUpController extends GetxController {
  bool isObscure = true;
  bool isLoading = false;
  bool isChecked = false;
  int currentGender = 0;
  String? identity;

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  List<GenderModel> gender = [
    GenderModel(title: 'male', value: 'male'),
    GenderModel(title: 'female', value: 'female')
  ];

  Future<bool> signUpUser({required SignUpModel signUpData}) async {
    if (!await ConnectivityService.isConnected()) {
      customErrorMessage(message: 'Please check your internet connection');
      return false;
    }
    _setLoading(true);
    try {
      final response = await ApiService().post(
        url: AppUrls.signUpUrl,
        data: signUpData,
      );
      _setLoading(false);
      if (response.success) {
        customSuccessMessage(message: 'Sent OTP Your Mobile');
        identity = response.data['data']['identity'];
        return true;
      } else {
        final errorMessage = response.message['message'] ?? 'Registration Failed';
        customErrorMessage(message: errorMessage);
        return false;
      }
    } catch (error) {
      customErrorMessage(message: error.toString());
      _setLoading(false);
      return false;
    }
  }

  Future<void> launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  void toggleObscure() {
    isObscure = !isObscure;
    update();
  }

  void toggleIsChecked(newValue) {
    isChecked = newValue;
    update();
  }

  void selectGender(int index) {
    currentGender = index;
    update();
  }

  void _setLoading(bool value) {
    isLoading = value;
    update();
  }
}
