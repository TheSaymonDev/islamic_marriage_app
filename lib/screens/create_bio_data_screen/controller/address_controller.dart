import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage/screens/create_bio_data_screen/model/address.dart';
import 'package:islamic_marriage/screens/create_bio_data_screen/model/test_data.dart';
import 'package:islamic_marriage/services/api_service.dart';
import 'package:islamic_marriage/utils/app_urls.dart';
import 'package:islamic_marriage/widgets/styles.dart';

class AddressController extends GetxController {
  bool isLoading = false;
  Address? address;
  final formKey = GlobalKey<FormState>();

  Division? selectedDivision;
  District? selectedDistrict;
  SubDistrict? selectedSubDistrict;

  Division? selectedDivision1;
  District? selectedDistrict1;
  SubDistrict? selectedSubDistrict1;

  final permanentAreaController = TextEditingController();
  final presentAreaController = TextEditingController();
  final growUpController = TextEditingController();
  bool isSameAsPermanent = false;
  String get permanentAddress {
    if (selectedDivision != null && selectedDistrict != null && selectedSubDistrict != null) {
      return '$selectedDivision, $selectedDistrict, $selectedSubDistrict';
    } else {
      return ''; // Or a default value indicating incomplete address
    }
  }
  String get presentAddress {
    if (selectedDivision1 != null && selectedDistrict1 != null && selectedSubDistrict1 != null) {
      return '$selectedDivision1, $selectedDistrict1, $selectedSubDistrict1';
    } else {
      return ''; // Or a default value indicating incomplete address
    }
  }
  Future<bool> createAddress() async {
    isLoading = true;
    update();
    try {
      final address = Address(
        permanentAddress: permanentAddress,
        isSameCurrentAddress: isSameAsPermanent,
        currentAddress: presentAddress,
        growUp: growUpController.text
      );
      final response = await ApiService().post(
          url: AppUrls.createAddressUrl,
          data: address,
          headers: AppUrls.getHeaderWithToken);
      if (response.success) {
        customSuccessMessage(message: 'Address Created Successful');
        isLoading = false;
        update();
        return true;
      } else {
        final errorMessage =
            response.message['message'] ?? 'Address Create Failed';
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

  Future<void> readAddress() async {
    isLoading = true;
    update();
    try {
      final response = await ApiService().get(url: AppUrls.readAddressUrl);
      if (response.success) {
        address = Address.fromJson(response.data['data']);
        isLoading = false;
        update();
      } else {
        final errorMessage =
            response.message['message'] ?? 'Address Read Failed';
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

  Future<bool> updateAddress() async {
    isLoading = true;
    update();
    try {
      final address = Address(
          permanentAddress: permanentAddress,
          isSameCurrentAddress: isSameAsPermanent,
          currentAddress: presentAddress,
          growUp: growUpController.text
      );
      final response = await ApiService().put(
          url: AppUrls.updateAddressUrl,
          data: address,
          headers: AppUrls.getHeaderWithToken);
      if (response.success) {
        customSuccessMessage(message: 'Address Updated Successful');
        isLoading = false;
        update();
        return true;
      } else {
        final errorMessage =
            response.message['message'] ?? 'Address Update Failed';
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
