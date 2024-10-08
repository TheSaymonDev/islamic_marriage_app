import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/model/dropdown_item.dart';
import 'package:islamic_marriage/screens/explore_screens/model/all_user.dart';
import 'package:islamic_marriage/services/api_service.dart';
import 'package:islamic_marriage/services/connectivity_service.dart';
import 'package:islamic_marriage/utils/app_urls.dart';
import 'package:islamic_marriage/utils/app_constant_functions.dart';

class AllBioDataController extends GetxController {
  bool isLoading = false;
  AllUser? allUser;

  DropdownItem? selectedBioDataType;
  DropdownItem? selectedMaritalStatus;

  final selectedDivision = TextEditingController();
  final selectedDistrict = TextEditingController();
  final selectedSubDistrict = TextEditingController();
  final selectedBioDataNo = TextEditingController();

  Future<void> getAllSearchedUser() async {
    if (!await ConnectivityService.isConnected()) {
      customErrorMessage(message: 'Please check your internet connection');
      return;
    }
    _setLoading(true);
    String url = _buildSearchUrl();
    try {
      final response = await ApiService().get(
        url: url,
        headers: AppUrls.getHeaderWithToken,
      );
      if (response.success) {
        allUser = AllUser.fromJson(response.data);
        _setLoading(false);
      } else {
        _handleError(response.message['message'] ?? 'All Bio Data Read Failed');
      }
    } catch (error) {
      _handleError(error.toString());
    } finally {
      _setLoading(false);
    }
  }

  void _setLoading(bool state) {
    isLoading = state;
    update();
  }

  void _handleError(String errorMessage) {
    customErrorMessage(message: errorMessage);
    isLoading = false;
    update();
  }

  String _buildSearchUrl() {
    String url =
        '${AppUrls.getAllUser}?status=approved';
    if (selectedBioDataType != null) {
      url += '&bioDataType=${selectedBioDataType!.value}';
    }
    if (selectedMaritalStatus != null) {
      url += '&maritalStatus=${selectedMaritalStatus!.value}';
    }
    if (selectedDivision.text.isNotEmpty) {
      url += '&division=${selectedDivision.text}';
    }
    if (selectedDistrict.text.isNotEmpty) {
      url += '&district=${selectedDistrict.text}';
    }
    if (selectedSubDistrict.text.isNotEmpty) {
      url += '&subDistrict=${selectedSubDistrict.text}';
    }
    if (selectedSubDistrict.text.isNotEmpty) {
      url += '&bioDataNo=${selectedBioDataNo.text}';
    }
    return url;
  }

  void clearData() {
    allUser?.data?.clear();
    selectedBioDataType = null;
    selectedMaritalStatus = null;
    selectedDivision.clear();
    selectedDistrict.clear();
    selectedSubDistrict.clear();
    selectedBioDataNo.clear();
    update();
  }

}
