import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage/screens/set_password_screen/models/set_password_model.dart';
import 'package:islamic_marriage/services/api_service.dart';
import 'package:islamic_marriage/services/connectivity_service.dart';
import 'package:islamic_marriage/utils/app_urls.dart';
import 'package:islamic_marriage/utils/app_constant_functions.dart';

class SetPasswordController extends GetxController {
  bool isObscureNew = true;
  bool isObscureConfirm = true;
  bool isLoading = false;

  String? identity;
  final formKey = GlobalKey<FormState>();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  Future<bool> setNewPassword(
      {required SetPasswordModel setPasswordData}) async {
    if (!await ConnectivityService.isConnected()) {
      customErrorMessage(message: 'Please check your internet connection');
      return false;
    }
    _setLoading(true);
    try {
      final response = await ApiService().post(
        url: AppUrls.setPasswordUrl,
        data: setPasswordData,
      );
      if (response.success) {
        customSuccessMessage(message: 'Password Successfully Changed');
        _setLoading(false);
        return true;
      } else {
        final errorMessage =
            response.message['message'] ?? 'Password Change Failed';
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

  void toggleObscureN() {
    isObscureNew = !isObscureNew;
    update();
  }

  void toggleObscureC() {
    isObscureConfirm = !isObscureConfirm;
    update();
  }

  void _setLoading(bool value) {
    isLoading = value;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    identity = Get.arguments['identity'] as String;
  }
}
