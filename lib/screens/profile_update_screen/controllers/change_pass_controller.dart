import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage/screens/profile_update_screen/models/change_pass_model.dart';
import 'package:islamic_marriage/services/api_service.dart';
import 'package:islamic_marriage/services/connectivity_service.dart';
import 'package:islamic_marriage/utils/app_urls.dart';
import 'package:islamic_marriage/utils/app_constant_functions.dart';

class ChangePassController extends GetxController {
  bool isObscureOld = true;
  bool isObscureNew = true;
  bool isObscureConfirm = true;
  bool isLoading = false;

  final formKey = GlobalKey<FormState>();
  final oldPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  Future<bool> changingPassword(
      {required ChangePassModel changePassData}) async {
    if (!await ConnectivityService.isConnected()) {
      customErrorMessage(message: 'Please check your internet connection');
      return false;
    }
    _setLoading(true);
    try {
      final response = await ApiService().patch(
          url: AppUrls.changePasswordUrl,
          data: changePassData,
          headers: AppUrls.getHeaderWithToken);
      if (response.success) {
        customSuccessMessage(message: 'Successfully Password Changed');
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

  void toggleObscureOld() {
    isObscureOld = !isObscureOld;
    update();
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
}
